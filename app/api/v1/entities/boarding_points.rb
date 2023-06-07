module V1
  module Entities
    class BoardingPoints < Grape::Entity
      expose :id
      expose :name
    end
  end
end
