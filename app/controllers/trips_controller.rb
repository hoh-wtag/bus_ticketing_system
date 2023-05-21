class TripsController < ApplicationController
  before_action :find_trip_by_id, only: %i[edit update destroy]
  load_and_authorize_resource

  def index
    @trips = Trip.all.order('id')
  end

  def new
    @trip = Trip.new
  end

  def edit; end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to action: 'index', status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @trip.update(trip_params)
      redirect_to action: 'index', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trip.destroy
    redirect_to action: 'index', status: :see_other
  end

  private

  def trip_params
    params.require(:trip).permit(:ticket_price, :total_booked, :date, :time, :bus_id, :route_id)
  end

  def find_trip_by_id
    @trip = Trip.find_by(id: params[:id])
    return if @trip

    flash[:alert] = "Trip #{t(:not_found)}"
    redirect_to action: 'index'
  end
end
