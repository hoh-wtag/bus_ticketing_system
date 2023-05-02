class User < ApplicationRecord
  has_many :tickets, dependent: :nullify

  enum role: { customer: 0, admin: 1 }
  validates :email, :user_name, :encrypted_password, :phone, :role, presence: true
  validates :first_name, :last_name, presence: true, format: { with: /\A[A-Za-z]+\z/ }
  validates :email, :user_name, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_plausible_phone :phone, presence: true
end
