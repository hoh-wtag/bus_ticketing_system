class BusesController < ApplicationController
  before_action :show, only: %i[edit update destroy]

  def index
    @buses = Bus.all
  end

  def new
    @bus = Bus.new
  end

  def edit; end

  def create
    @bus = Bus.new(bus_params)
    if @bus.save
      redirect_to action: 'index', status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bus.update(bus_params)
      redirect_to action: 'index', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bus.destroy
    redirect_to action: 'index', status: :see_other
  end

  private

  def bus_params
    params.require(:bus).permit(:code, :bus_type, :company, :capacity)
  end

  def show
    @bus = Bus.find(params[:id])
  end
end
