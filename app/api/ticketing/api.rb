module Ticketing
  class Api < Grape::API
    format :json
    prefix :api
    version 'v1', :path
    mount Ticketing::V1::Buses
  end
end
