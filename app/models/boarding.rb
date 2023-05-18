class Boarding < ApplicationRecord
  has_one :ticket, dependent: :nullify
  belongs_to :trip
  belongs_to :boarding_point

  validates :time, presence: true

  validate :time_is_after_trip_time

  def time_is_after_trip_time
    return unless time && trip && time < trip.time

    errors.add(:time, 'must be after trip time')
  end
end
