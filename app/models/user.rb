class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  include Resources
  include WhitespaceValidation

  has_many :tickets, dependent: :nullify
  has_many :access_grants,
           class_name:  'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent:   :delete_all

  has_many :access_tokens,
           class_name:  'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent:   :delete_all

  USER_ROLE = { customer: 0, admin: 1 }.freeze
  enum role: USER_ROLE
  validates :email, :user_name, :phone, :role, presence: true
  validates :first_name, :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :email, :user_name, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_plausible_phone :phone, presence: true
end
