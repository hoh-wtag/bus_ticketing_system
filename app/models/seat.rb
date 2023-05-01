class Seat < ApplicationRecord
  enum seat_status: { seat_available: 0, on_hold: 1, booked: 2 }
  validates :seat_status, presence: true
  validates :seat_code, presence: true, format: { with: /\A[A-Z]\d$\z/ }
end
