module Ticketing
  module V1
    class Buses < Grape::API
      resources :buses do
        desc 'Get all Bus'
        get do
          Bus.all
        end

        desc 'Get Bus by id'
        route_param :id do
          get do
            Bus.find_by(id: params[:id])
          end
        end

        desc 'Create a Bus'
        params do
          requires :code, type: String
          requires :typed, type: Integer
          requires :company, type: String
          requires :capacity, type: Integer
        end

        post do
          @bus = Bus.new(params)
          return { 'error': @bus.errors } unless @bus.save
          return @bus
        end

        desc 'update a Bus'

        route_param :id do
          put do
            @bus = Bus.find(params[:id])
            return { 'error': @bus.errors } unless @bus.update(params)
            @bus
          end
        end

        desc 'delete a Bus'
        route_param :id do
          delete do
            Bus.find(params[:id]).destroy
          end
        end
      end
    end
  end
end
