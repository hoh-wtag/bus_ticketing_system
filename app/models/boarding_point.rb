class BoardingPoint < ApplicationRecord
  include Resources

  has_many :boardings, dependent: :nullify
  has_many :trips, through: :boardings

  validates :name, presence: true, format: { with: VALID_LOCATION_REGEX }
  validates :name, uniqueness: { case_sensitive: false }

  before_validation :strip_whitespace

  private

  def strip_whitespace
    attributes.each do |attr, value|
      self[attr] = value.strip if value.respond_to?(:strip)
    end
  end
end
