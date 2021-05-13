class FlatsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(set_params)
    @flat.save
    redirect_to flat_path(@flat)
  end

  def show
  end

  def edit
  end

  def update
    @flat.update(set_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def set_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def set_restaurant
    @flat = Flat.find(params[:id])
  end
end
