class Ticket < ApplicationRecord
  has_many :seats, dependent: :nullify
  belongs_to :user
  belongs_to :payment
  belongs_to :bus, optional: true
  belongs_to :trip, optional: true
  belongs_to :boarding

  validates :total_fare, presence: true
end
