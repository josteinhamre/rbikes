class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @bike = Bike.find(params[:bike_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    @booking.user = current_user
    if @booking.save
      redirect_to bike_path(@bike)
    else
      # raise
      render 'new'
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.confirmed_at = Date.today
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
