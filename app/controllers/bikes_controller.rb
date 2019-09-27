require 'date'

class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    if params[:start_date].present? #check for end_date at some point
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @bikes = Bike.all
      @bikes = @bikes.select do |bike|
        bike.available_range?(start_date, end_date)
      end
    else
      @bikes = Bike.all
    end
  end

  def show
    @bike = Bike.find(params[:id])
    @booking = Booking.new
  end


  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def bike_params
    params.require(:bike).permit(:brand, :model, :bike_type, :production_year, :color, :description, :photo, :location)
  end
end

