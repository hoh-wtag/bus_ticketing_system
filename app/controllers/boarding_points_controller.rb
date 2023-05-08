class BoardingPointsController < ApplicationController
  before_action :show, only: %i[edit update destroy]

  def index
    @boarding_points = BoardingPoint.all
  end

  def new
    @boarding_point = BoardingPoint.new
  end

  def edit; end

  def create
    @boarding_point = BoardingPoint.new(boarding_point_params)

    if @boarding_point.save
      redirect_to action: "index", status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @boarding_point.update(boarding_point_params)
      redirect_to action: "index", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @boarding_point.destroy
    redirect_to action: "index", status: :see_other
  end

  private

  def boarding_point_params
    params.require(:boarding_point).permit(:name)
  end

  def show
    @boarding_point = BoardingPoint.find(params[:id])
  end
end
