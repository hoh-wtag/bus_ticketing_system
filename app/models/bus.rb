class Bus < ApplicationRecord
    enum bus_type: { ac: 0 , non_ac: 1 }
    validates :bus_code, :bus_company, :bus_type, :bus_capacity, presence: true

    validates :bus_code, format: { with: /\A\S*\z/ }
    validates :bus_code, uniqueness: { case_sensitive: false }

    validates :bus_capacity, numericality: { greater_than: 0, less_than_or_equal_to: 60 }

end
