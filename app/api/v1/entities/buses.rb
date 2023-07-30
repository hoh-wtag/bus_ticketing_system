module V1
  module Entities
    class Buses < Grape::Entity
      expose :id
      expose :code
      expose :company
      expose :bus_type
      expose :capacity
    end
  end
end
