class Route < ApplicationRecord
  include Resources
  include WhitespaceValidation

  has_many :trips, dependent: :nullify

  validates :source, :destination, presence: true, format: { with: VALID_LOCATION_REGEX }
  validates :source, uniqueness: { scope: :destination }

  attr_accessor :name

  after_initialize :full_name

  def full_name
    self.name = "#{source} - #{destination}"
  end
end
