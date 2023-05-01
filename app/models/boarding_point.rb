class BoardingPoint < ApplicationRecord
  validates :boarding_point_name, presence: true, format: { with: /\A[A-Za-z\s]+\z/ }
end
