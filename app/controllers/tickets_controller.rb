class TicketsController < ApplicationController
  before_action :find_dependency, only: %i[index]
  before_action :authenticate_user!, only: %i[process_payment confirm_payment]

  def index
    @sources = Route.select('DISTINCT ON (source) *')
    @destinations = @destination || []
    @trips = @trip || []
  end

  def book_seats
    @trip = Trip.find_by(id: params[:id])

    if @trip.bus.nil?
      flash[:alert] = 'Bus Not Available'
      return redirect_to action: 'index', status: :see_other
    end
    @bus = Bus.find_by(id: @trip.bus.id)
    @seats = Seat.where(trip: @trip).order(id: :asc)
    @boardings = Boarding.where(trip: @trip).order(id: :asc)
  end

  def confirm_payment
    @seats = session[:seats]
    @trip = Trip.find_by(id: session[:trip])
    @boarding = Boarding.find_by(id: session[:boarding])
    @payment = Payment.create
    @total = @seats.size * @trip.ticket_price
    @ticket = Ticket.new(total_fare: @total, user: current_user, payment: @payment, trip: @trip, boarding: @boarding,
                         bus: @trip.bus)

    for i in @seats
      next unless @trip.seats.find_by(id: i).status != 'seat_available'

      flash[:alert] = 'Booking Failed'
      return redirect_to action: 'index', status: :see_other

    end
    if @ticket.save
      for i in @seats
        @trip.seats.find_by(id: i).update(status: 'booked', ticket: @ticket)
      end
      flash[:notice] = 'Succesfully Booked'
      @trip.update(total_booked: @trip.total_booked + @seats.size)

      redirect_to action: 'index', status: :see_other
    else

      flash[:alert] = 'Booking Failed'
      redirect_to action: 'index', status: :see_other
    end
  end

  def process_payment
    @seats = session[:seats]
    @trip = Trip.find_by(id: session[:trip])
    @boarding = Boarding.find_by(id: session[:boarding])
    @total = @trip.ticket_price * session[:seats].size
    return unless @total == 0

    flash[:alert] = 'Select atleast 1 seat'
    redirect_to book_seats_path(@trip), status: :see_other
  end

  def payment
    @seats = []
    params.each do |key, value|
      @seats.push(value) if key == value
    end
    @seat_session = session[:seats] || []
    session[:seats] = @seats
    session[:trip] = params[:trip_id]
    session[:boarding] = params[:boarding_id]
    redirect_to process_payment_path, status: :see_other
  end

  private

  def find_dependency
    @source = Route.find_by(id: params[:source].presence)
    @destination = Route.where(source: params[:source].presence)
    @trip = Trip.where(date:  params[:date].presence,
                       route: Route.find_by(source:      params[:source].presence,
                                            destination: params[:destination].presence))
  end
end
