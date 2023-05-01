class Ticket < ApplicationRecord
  validates :total_fare, presence: true
end
