class Trip < ApplicationRecord
  validates :ticket_price, :total_booked, :trip_date, :trip_time, presence: true
  validates :ticket_price, numericality: { greater_than: 0, less_than_or_equal_to: 10_000 }
end
