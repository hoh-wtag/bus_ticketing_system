class BoardingPoint < ApplicationRecord
  include Resources
  include WhitespaceValidation

  has_many :boardings, dependent: :nullify
  has_many :trips, through: :boardings

  validates :name, presence: true, format: { with: VALID_LOCATION_REGEX }
  validates :name, uniqueness: { case_sensitive: false }
end
