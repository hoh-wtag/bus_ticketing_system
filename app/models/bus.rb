class Bus < ApplicationRecord
  include Resources

  has_many :tickets, dependent: :nullify
  has_many :trips, dependent: :nullify

  enum bus_type: { ac: 0, non_ac: 1 }
  validates :code, :company, :bus_type, :capacity, presence: true

  validates :code, format: { with: VALID_BUSCODE_REGEX }
  validates :code, uniqueness: { case_sensitive: false }

  validates :capacity, numericality: { greater_than: 0, less_than_or_equal_to: 60 }
end
