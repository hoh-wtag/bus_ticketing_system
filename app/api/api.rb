class Api < Grape::API
  format :json
  prefix :api
  version 'v1', :path
  mount V1::Resources::Buses
end
