class User < ApplicationRecord
  validates :first_name, :last_name, :url, :email, presence: true

  def name
    [first_name, last_name].join(' ')
  end
end
