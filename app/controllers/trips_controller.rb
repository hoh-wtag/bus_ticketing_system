class TripsController < ApplicationController
  before_action :show, only: %i[edit update destroy]

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def edit; end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to action: "index", status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @trip.update(trip_params)
      redirect_to action: "index", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trip.destroy
    redirect_to action: "index", status: :see_other
  end

  private

  def trip_params
    params.require(:trip).permit(:ticket_price, :total_booked, :date, :time, :bus_id, :route_id)
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
