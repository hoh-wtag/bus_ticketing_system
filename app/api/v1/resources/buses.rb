module V1
  module Resources
    class Buses < Grape::API
      resources :buses do
        desc 'Get all Bus'
        get do
          @bus = Bus.all
          present @bus, with: V1::Entities::Buses
        end

        desc 'Get Bus by id'
        route_param :id do
          get do
            @bus = Bus.find_by(id: params[:id])
            present @bus, with: V1::Entities::Buses
          end
        end

        desc 'Create a Bus'
        params do
          requires :code, type: String
          requires :bus_type, type: Integer
          requires :company, type: String
          requires :capacity, type: Integer
        end

        post do
          @bus = Bus.new(params)
          return { error: @bus.errors } unless @bus.save

          present @bus, with: V1::Entities::Buses
        end

        desc 'Update Bus by id'

        route_param :id do
          put do
            @bus = Bus.find(params[:id])
            
            binding.pry
            

            return { error: @bus.errors } unless @bus.update(params)

            present @bus, with: V1::Entities::Buses
          end
        end

        desc 'Delete Bus by id'
        route_param :id do
          delete do
            Bus.find(params[:id]).destroy
            present @bus, with: V1::Entities::Buses
          end
        end
      end
    end
  end
end
