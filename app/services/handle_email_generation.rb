class HandleEmailGeneration
  def initialize(params)
    @params = params
  end

  def process
    generate_emails.map do |email|
      response = MailBoxLayer::Validator.call(email)
      sleep 1

      return { valid: false, error: response[:error], status: 422 } if response[:error]

      if response[:valid]
        user = User.where(permitted_params).first_or_initialize
        user.email = email
        user.save

        return { valid: true, user: user, status: 200 }
      end
    end

    { error: 'No valid email found against this contact', status: 422 }
  end

  private

  def generate_emails
    first_name = permitted_params[:first_name].downcase
    last_name = permitted_params[:last_name].downcase
    url = permitted_params[:url]

    ["#{first_name}.#{last_name}", first_name, "#{first_name}#{last_name}", "#{last_name}.#{first_name}", "#{first_name[0]}.#{last_name}", "#{first_name[0]}#{last_name[0]}"].map { |local| "#{local}@#{url}"}
  end

  def create_params(email)
    permitted_params.tap do |pp|
      pp[:email] = email
    end
  end

  def permitted_params
    @permitted_params ||= @params.require(:user).permit(:first_name, :last_name, :url)
  end
end
