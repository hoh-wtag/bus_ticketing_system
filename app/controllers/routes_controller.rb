class RoutesController < ApplicationController
  before_action :show, only: %i[edit update destroy]

  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def edit; end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to action: "index", status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @route.update(route_params)
      redirect_to action: "index", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @route.destroy
    redirect_to action: "index", status: :see_other
  end

  private

  def route_params
    params.require(:route).permit(:source, :destination)
  end

  def show
    @route = Route.find(params[:id])
  end
end
