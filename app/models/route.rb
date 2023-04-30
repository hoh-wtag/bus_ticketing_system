class Route < ApplicationRecord
    validates :route_source, :route_destination, presence: true, format: { with: /\A[A-Za-z\s]+\z/ }
    attr_accessor :route_name

    after_initialize :getRouteName

    def getRouteName
      self.route_name = route_source.to_s + '-' + route_destination.to_s
    end
end
