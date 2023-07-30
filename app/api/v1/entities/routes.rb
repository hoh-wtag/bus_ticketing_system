module V1
  module Entities
    class Routes < Grape::Entity
      expose :id
      expose :source
      expose :destination
    end
  end
end
