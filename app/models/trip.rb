class Trip < ApplicationRecord
  has_many :tickets, dependent: :nullify
  belongs_to :bus, optional: true
  belongs_to :route, optional: true
  has_many :boardings, dependent: :nullify
  has_many :boarding_points, through: :boardings

  validates :ticket_price, :total_booked, :trip_date, :trip_time, presence: true
  validates :ticket_price, numericality: { greater_than: 0, less_than_or_equal_to: 10_000 }
end
