class BusesController < ApplicationController
  before_action :find_bus_by_id, only: %i[edit update destroy]

  def index
    @buses = Bus.all.order('id')
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

  def find_bus_by_id
    @bus = Bus.find_by(id: params[:id])
    return if @bus

    flash[:alert] = I18n.t('not_found.bus_not_found')
    redirect_to action: 'index'
  end
end
