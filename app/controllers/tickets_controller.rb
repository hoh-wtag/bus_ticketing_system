class TicketsController < ApplicationController
  before_action :find_dependency, only: %i[index]
  before_action :authenticate_user!, only: %i[process_payment confirm_payment]

  def index
    @sources = Route.distinct(:source)
    @destinations = @destination || []
    @trips = @trip || []
  end

  def book_seats
    @trip = Trip.find_by(id: params[:id])

    if @trip.bus.nil?
      flash[:alert] = I18n.t('not_found.bus_not_found')
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
    @ticket = Ticket.new(total_fare: @total,
                         user:       current_user,
                         payment:    @payment,
                         trip:       @trip,
                         boarding:   @boarding,
                         bus:        @trip.bus)

    return redirect_booking_failed if booking_failed?

    if @ticket.save
      update_seat_status
      flash[:notice] = I18n.t('booking.success')
      @trip.update(total_booked: @trip.total_booked + @seats.size)
    else
      flash[:alert] = I18n.t('booking.failed')
    end

    redirect_to root_path, status: :see_other
  end

  def process_payment
    @seats = session[:seats]
    @trip = Trip.find_by(id: session[:trip])
    @boarding = Boarding.find_by(id: session[:boarding])
    @total = @trip.ticket_price * session[:seats].size

    return redirect_process_failed if process_failed?

    @seats.each do |seat_id|
      @trip.seats.find_by(id: seat_id).update(status: 'on_hold', ticket: @ticket)
    end
    return unless @total.zero?

    flash[:alert] = I18n.t('booking.select_minimum_seat')
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

  def booking_failed?
    @seats.any? { |seat_id| @trip.seats.find_by(id: seat_id).status != 'on_hold' }
  end

  def process_failed?
    @seats.any? { |seat_id| @trip.seats.find_by(id: seat_id).status != 'seat_available' }
  end

  def redirect_booking_failed
    flash[:alert] = I18n.t('booking.failed')
    redirect_to(action: 'index', status: :see_other)
  end

  def redirect_process_failed
    flash[:alert] = I18n.t('booking.select_again')
    redirect_to(action: 'index', status: :see_other)
  end

  def update_seat_status
    @seats.each do |seat_id|
      @trip.seats.find_by(id: seat_id).update(status: 'booked', ticket: @ticket)
    end
  end
end
