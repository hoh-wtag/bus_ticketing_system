class Route < ApplicationRecord
  include Resources
  include WhitespaceValidation

  has_many :trips, dependent: :nullify

  validates :source, :destination, presence: true, format: { with: VALID_LOCATION_REGEX }
  validates :source, uniqueness: { scope: :destination }

  def full_name
    "#{source} - #{destination}"
  end
end
