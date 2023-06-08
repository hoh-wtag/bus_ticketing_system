class Api < Grape::API
  format :json
  prefix :api
  version 'v1', :path

  mount V1::Resources::Buses
  mount V1::Resources::Routes
  mount V1::Resources::BoardingPoints
  mount V1::Resources::Trips
  mount V1::Resources::Ticketing
end
