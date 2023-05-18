class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  include Resources
  include WhitespaceValidation

  has_many :tickets, dependent: :nullify

  USER_ROLE = { customer: 0, admin: 1 }.freeze
  enum role: USER_ROLE
  validates :email, :user_name, :password, :phone, :role, presence: true
  validates :first_name, :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :email, :user_name, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_plausible_phone :phone, presence: true
end
