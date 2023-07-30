require 'doorkeeper/grape/helpers'
module V1
  module Resources
    class BoardingPoints < Grape::API
      helpers Doorkeeper::Grape::Helpers

      before do
        doorkeeper_authorize!
      end

      before do
        @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
        error!('401 Unauthorized', 401) unless @current_user.admin?
      end

      resources :boarding_points do
        desc 'Get all BoardingPoint'
        get do
          @boarding_point = BoardingPoint.all
          present @boarding_point, with: V1::Entities::BoardingPoints
        end

        desc 'Get BoardingPoint by id'
        route_param :id do
          get do
            @boarding_point = BoardingPoint.find_by(id: params[:id])
            present @boarding_point, with: V1::Entities::BoardingPoints
          end
        end

        desc 'Create a BoardingPoint'
        params do
          requires :name, type: String
        end

        post do
          @boarding_point = BoardingPoint.new(params)
          return { error: @boarding_point.errors } unless @boarding_point.save

          present @boarding_point, with: V1::Entities::BoardingPoints
        end

        desc 'Update BoardingPoint by id'

        route_param :id do
          put do
            @boarding_point = BoardingPoint.find(params[:id])

            return { error: @boarding_point.errors } unless @boarding_point.update(params)

            present @boarding_point, with: V1::Entities::BoardingPoints
          end
        end

        desc 'Delete BoardingPoint by id'
        route_param :id do
          delete do
            BoardingPoint.find(params[:id]).destroy
            present @boarding_point, with: V1::Entities::BoardingPoints
          end
        end
      end
    end
  end
end
