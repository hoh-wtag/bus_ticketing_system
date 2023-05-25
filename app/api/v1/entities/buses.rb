module V1
  module Entities
    class Buses < Grape::Entity
      expose :id
      expose :code
      expose :company
    end
  end
end
