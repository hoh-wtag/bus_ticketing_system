class Trip < ApplicationRecord
  has_many :tickets, dependent: :nullify
  belongs_to :bus, optional: true
  has_many :seats, dependent: :nullify
  belongs_to :route, optional: true
  has_many :boardings, dependent: :nullify
  has_many :boarding_points, through: :boardings

  validates :ticket_price, :total_booked, :date, :time, presence: true
  validates :ticket_price, numericality: { greater_than: 0, less_than_or_equal_to: 10_000 }
  validates :total_booked, numericality: { greater_than_or_equal_to: 0 }

  validate :check_if_present

  def check_if_present
    return unless new_record?
    return unless Trip.where(date:, time:, bus:).size >= 1

    errors.add(:time, "#{bus.code} has exisitng trip on #{date} - #{time}")
  end

  after_create :create_seats

  private

  def create_seats
    (0..bus.capacity - 1).each { |a| Seat.create(code: "#{((a / 4) + 65).chr}#{(a % 4) + 1}", status: 0, trip_id: id) }
  end
end
