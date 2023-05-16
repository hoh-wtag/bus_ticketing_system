class Bus < ApplicationRecord
  include Resources
  include WhitespaceValidation

  has_many :tickets, dependent: :nullify
  has_many :trips, dependent: :nullify

  BUSTYPE = { ac: 0, non_ac: 1 }.freeze
  enum bus_type: BUSTYPE
  validates :code, :company, :bus_type, :capacity, presence: true

  validates :code, format: { with: VALID_BUSCODE_REGEX }
  validates :code, uniqueness: { case_sensitive: false }

  validates :capacity, numericality: { greater_than: 0, less_than_or_equal_to: 60 }
end
