class User < ApplicationRecord
  include Resources

  has_many :tickets, dependent: :nullify

  enum role: { customer: 0, admin: 1 }
  validates :email, :user_name, :password, :phone, :role, presence: true
  validates :first_name, :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :email, :user_name, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates_plausible_phone :phone, presence: true
end
