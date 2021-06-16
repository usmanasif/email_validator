class MailBoxLayer::Validator
  include HTTParty
  base_uri 'http://apilayer.net/api/check?'

  def self.call(email)
    new.call(email)
  end

  def call(email)
    @response = self.class.get('', { query: { email: email, access_key: ENV['MAIL_BOX_LAYER_ACCESS_KEY'] } })
    @response = @response.parsed_response

    if @response.dig('success') == false
      return { error: @response.dig('error', 'info') }
    end

    { valid: valid_email? }
  rescue StandardError => e
    { error: 'there is something wrong' }
  end

  private

  def valid_email?
     @response.dig('format_valid') && @response.dig('mx_found') && @response.dig('smtp_check') && !@response.dig('catch_all')
  end
end
