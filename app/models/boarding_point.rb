class BoardingPoint < ApplicationRecord
  has_many :boardings, dependent: :nullify
  has_many :trips, through: :boardings

  validates :boarding_point_name, presence: true, format: { with: /\A[A-Za-z\s]+\z/ }
end
