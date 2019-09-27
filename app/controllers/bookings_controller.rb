# require 'Date'
class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @bike = Bike.find(params[:bike_id])
  end

  def create

    @booking = Booking.new
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    @booking.user = current_user
    @booking.start_date = Date.parse(params['booking']['start_date'][0, 10])
    @booking.end_date = Date.parse(params['booking']['start_date'][14, 23])
    if @booking.save
      flash[:notice] = "Your booking has successfully been submitted!"
      redirect_to bike_path(@bike)
    else
      # raise
      render 'new'
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.confirmed_at = Date.today
    unless @booking.save
      flash[:alert] = "Unable to confirm booking!"
    end
    redirect_to profile_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
