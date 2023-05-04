class Route < ApplicationRecord
  has_many :trips, dependent: :nullify

  validates :source, :destination, presence: true, format: { with: /\A[A-Za-z\s]+\z/ }
  attr_accessor :name

  after_initialize :full_name

  def full_name
    self.name = "#{source} - #{destination}"
  end
end
