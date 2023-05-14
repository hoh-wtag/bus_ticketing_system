class BoardingPoint < ApplicationRecord
  include Resources

  has_many :boardings, dependent: :nullify
  has_many :trips, through: :boardings

  validates :name, presence: true, format: { with: VALID_LOCATION_REGEX }, uniqueness: { case_sensitive: false }
end
