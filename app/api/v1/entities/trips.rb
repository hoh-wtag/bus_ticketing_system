module V1
  module Entities
    class Trips < Grape::Entity
      expose :id
      expose :ticket_price
      expose :total_booked
      expose :date
      expose :time
      expose :bus_id
      expose :route_id
    end
  end
end
