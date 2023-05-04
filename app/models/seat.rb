class Seat < ApplicationRecord
  belongs_to :ticket, optional: true
  belongs_to :trip, optional: true

  enum status: { seat_available: 0, on_hold: 1, booked: 2 }
  validates :status, presence: true
  validates :code, presence: true, format: { with: /\A[A-Z]\d$\z/ }
end
