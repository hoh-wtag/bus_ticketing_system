class Route < ApplicationRecord
  has_many :trips, dependent: :nullify

  validates :route_source, :route_destination, presence: true, format: { with: /\A[A-Za-z\s]+\z/ }
  attr_accessor :route_name

  after_initialize :full_route_name

  def full_route_name
    self.route_name = "#{route_source} - #{route_destination}"
  end
end
