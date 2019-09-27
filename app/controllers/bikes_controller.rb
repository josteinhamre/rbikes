class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    if params[:query].present?
      @bikes = Bike.where("%#{params[:query]}%")
  # sql_query = "daterange(start_date, end_date, '[]') && daterange(:start_date, :end_date, '[]')"
    else
    @bikes = Bike.all
  # end
  end
end
  def show
    @bike = Bike.find(params[:id])
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

