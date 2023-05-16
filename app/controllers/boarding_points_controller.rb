class BoardingPointsController < ApplicationController
  before_action :find_boarding_point_by_id, only: %i[edit update destroy]

  def index
    @boarding_points = BoardingPoint.all.order('id')
  end

  def new
    @boarding_point = BoardingPoint.new
  end

  def edit; end

  def create
    @boarding_point = BoardingPoint.new(boarding_point_params)

    if @boarding_point.save
      redirect_to action: 'index', status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @boarding_point.update(boarding_point_params)
      redirect_to action: 'index', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @boarding_point.destroy
    redirect_to action: 'index', status: :see_other
  end

  private

  def boarding_point_params
    params.require(:boarding_point).permit(:name)
  end

  def find_boarding_point_by_id
    @boarding_point = BoardingPoint.find_by(id: params[:id])

    return if @boarding_point

    flash[:alert] = "Boarding Point #{t(:not_found)}"
    redirect_to action: 'index'
  end
end
