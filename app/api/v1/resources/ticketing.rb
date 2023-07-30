require 'doorkeeper/grape/helpers'
module V1
  module Resources
    class Ticketing < Grape::API
      helpers Doorkeeper::Grape::Helpers
      format :json
      resources :ticketing do
        desc 'Get all Trips'
        params do
          requires :source, type: String
          requires :destination, type: String
          requires :date, type: String
        end

        get :trips do
          @trips = Trip.where(date:  params[:date].presence,
                              route: Route.find_by(source:      params[:source].presence,
                                                   destination: params[:destination].presence))
        end

        get 'Get all seats'
        get 'seats/:id' do
          @trip = Trip.find_by(id: params[:id])
          @seats = @trip.seats.order(id: :asc)
        end

        get 'Get all boardings'
        get 'boardings/:id' do
          @trip = Trip.find_by(id: params[:id])

          @boardings = @trip.boardings.order(id: :asc)
        end

        desc 'Book Seats'
        post do
          @seats = params[:seats].split(',')

          @trip = Trip.find_by(id: params[:trip_id])
          @payment = Payment.create
          @boarding = Boarding.find_by(id: params[:boarding_id])
          @total = @seats.size * @trip.ticket_price
          @current_user ||= User.find(doorkeeper_token[:resource_owner_id])

          @ticket = Ticket.new(total_fare: @total, user: @current_user, payment: @payment, trip: @trip,
                               bus: @trip.bus, boarding: @boarding)

          for i in @seats
            next unless @trip.seats.find_by(id: i).status != 'seat_available'

            return { error: 'Seat is already booked by others' }

          end

          return { error: 'Something went wrong' } unless @ticket.save

          for i in @seats
            @trip.seats.find_by(id: i).update(status: 'booked', ticket: @ticket)
          end
          return { message: 'Succesfully Booked' }
        end
      end
    end
  end
end
