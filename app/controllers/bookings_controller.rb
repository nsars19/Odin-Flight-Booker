class BookingsController < ApplicationController
  def new
    @flight = Flight.find params[:selected_flight]
    @booking = Booking.new
    params[:num_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      @booking.passengers.each do |passenger|
        BookingMailer.with(user: passenger).thanks_for_booking.deliver_now
      end

      redirect_to booking_path(@booking)
    else
      render new_booking_path
    end
  end

  def show
    @booking = Booking.find params[:id]
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :num_passengers,
      passengers_attributes: [:id, :name, :email])
  end
end
