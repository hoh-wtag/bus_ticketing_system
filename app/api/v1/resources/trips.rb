require 'doorkeeper/grape/helpers'
module V1
  module Resources
    class Trips < Grape::API
      helpers Doorkeeper::Grape::Helpers

      before do
        doorkeeper_authorize!
      end

      before do
        @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
        error!('401 Unauthorized', 401) unless @current_user.admin?
      end

      resources :trips do
        desc 'Get all Trip'
        get do
          @trip = Trip.all
          present @trip, with: V1::Entities::Trips
        end

        desc 'Get Trip by id'
        route_param :id do
          get do
            @trip = Trip.find_by(id: params[:id])
            present @trip, with: V1::Entities::Trips
          end
        end

        desc 'Create a Trip'
        params do
          requires :ticket_price, type: Integer
          requires :date, type: Date
          requires :time, type: Time
          requires :bus_id, type: Integer
          requires :route_id, type: Integer
        end

        post do
          @trip = Trip.new(params)
          return { error: @trip.errors } unless @trip.save

          present @trip, with: V1::Entities::Trips
        end

        desc 'Update Trip by id'

        route_param :id do
          put do
            @trip = Trip.find(params[:id])

            return { error: @trip.errors } unless @trip.update(params)

            present @trip, with: V1::Entities::Trips
          end
        end

        desc 'Delete Trip by id'
        route_param :id do
          delete do
            Trip.find(params[:id]).destroy
            present @trip, with: V1::Entities::Trips
          end
        end
      end
    end
  end
end
