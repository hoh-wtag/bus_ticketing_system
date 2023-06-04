class RoutesController < ApplicationController
  before_action :find_route_by_id, only: %i[edit update destroy]

  def index
    @routes = Route.all.order('id')
  end

  def new
    @route = Route.new
  end

  def edit; end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to action: 'index', status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @route.update(route_params)
      redirect_to action: 'index', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @route.destroy
    redirect_to action: 'index', status: :see_other
  end

  private

  def route_params
    params.require(:route).permit(:source, :destination)
  end

  def find_route_by_id
    @route = Route.find_by(id: params[:id])

    return if @route

    flash[:alert] = I18n.t('not_found.route_not_found')
    redirect_to action: 'index'
  end
end
