require 'doorkeeper/grape/helpers'
module V1
  module Resources
    class Routes < Grape::API
      helpers Doorkeeper::Grape::Helpers

      before do
        doorkeeper_authorize!
      end

      before do
        @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
        error!('401 Unauthorized', 401) unless @current_user.admin?
      end

      resources :routes do
        desc 'Get all Routes'
        get do
          @route = Route.all
          present @route, with: V1::Entities::Routes
        end

        desc 'Get Route by id'
        route_param :id do
          get do
            @route = Route.find_by(id: params[:id])
            present @route, with: V1::Entities::Routes
          end
        end

        desc 'Create a Route'
        params do
          requires :source, type: String
          requires :destination, type: String
        end

        post do
          @route = Route.new(params)
          return { error: @route.errors } unless @route.save

          present @route, with: V1::Entities::Routes
        end

        desc 'Update Route by id'

        route_param :id do
          put do
            @route = Route.find(params[:id])

            return { error: @route.errors } unless @route.update(params)

            present @route, with: V1::Entities::Routes
          end
        end

        desc 'Delete Route by id'
        route_param :id do
          delete do
            Route.find(params[:id]).destroy
            present @route, with: V1::Entities::Routes
          end
        end
      end
    end
  end
end
