class Boarding < ApplicationRecord
  has_one :ticket, dependent: :nullify
  belongs_to :trip
  belongs_to :boarding_point
  validates :time, presence: true
end
