class Trip < ApplicationRecord
  has_many :tickets, dependent: :nullify
  has_many :seats, dependent: :nullify
  has_many :boardings, dependent: :nullify
  has_many :boarding_points, through: :boardings
  belongs_to :bus, optional: true
  belongs_to :route, optional: true

  validates :ticket_price, :total_booked, :date, :time, presence: true
  validates :ticket_price, numericality: { greater_than: 0, less_than_or_equal_to: 10_000 }
  validates :total_booked, numericality: { greater_than_or_equal_to: 0 }

  before_validation :strip_whitespace
  after_create :create_seats

  private

  def create_seats
    (0..bus.capacity - 1).each do |a|
      Seat.create(code: "#{((a / 4) + 65).chr}#{(a % 4) + 1}", status: 0, trip_id: id)
    end
  end

  def strip_whitespace
    attributes.each do |attr, value|
      self[attr] = value.strip if value.respond_to?(:strip)
      self[attr] = value.squeeze(' ') if value.respond_to?(:squeeze)
    end
  end
end
