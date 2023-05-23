class TripsController < ApplicationController
  before_action :find_trip_by_id, only: %i[edit update destroy]
  load_and_authorize_resource

  def index
    @trips = Trip.all.order(sort_column)
  end

  def new
    @trip = Trip.new
    @trip.boardings.build
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

  def sort_column
    default_column = 'id'
    default_direction = 'asc'

    sortable_columns = ['id', 'ticket_price', 'date', 'time']
    sortable_directions = %w[asc desc]

    sort_column = params[:sort_column].in?(sortable_columns) ? params[:sort_column] : default_column

    sort_direction = if params[:sort_direction].in?(sortable_directions)
                       params[:sort_direction]
                     else
                       default_direction
                     end

    "#{sort_column} #{sort_direction}"
  end

  def trip_params
    params.require(:trip).permit(:ticket_price,
                                 :total_booked,
                                 :date, :time,
                                 :bus_id,
                                 :route_id,
                                 boardings_attributes: %i[id time boarding_point_id _destroy])
  end

  def find_trip_by_id
    @trip = Trip.find_by(id: params[:id])
    return if @trip

    flash[:alert] = I18n.t('not_found.trip_not_found')
    redirect_to action: 'index'
  end
end
