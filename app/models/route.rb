class Route < ApplicationRecord
  include Resources

  has_many :trips, dependent: :nullify

  validates :source, :destination, presence: true, format: { with: VALID_LOCATION_REGEX }
  validates :source, uniqueness: { scope: :destination }

  attr_accessor :name

  after_initialize :full_name

  def full_name
    self.name = "#{source} - #{destination}"
  end

  before_validation :strip_whitespace

  private

  def strip_whitespace
    attributes.each do |attr, value|
      self[attr] = value.strip if value.respond_to?(:strip)
      self[attr] = value.squeeze(' ') if value.respond_to?(:squeeze)
    end
  end
end
