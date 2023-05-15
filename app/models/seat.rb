class Seat < ApplicationRecord
  include Resources

  belongs_to :ticket, optional: true
  belongs_to :trip, optional: true

  SEAT_STATUS = { seat_available: 0, on_hold: 1, booked: 2 }.freeze
  enum status: SEAT_STATUS
  validates :status, presence: true
  validates :code, presence: true, format: { with: VALID_SEATCODE_REGEX }
end
