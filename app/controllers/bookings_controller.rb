class BookingsController < ApplicationController
  def new
    @flight = Flight.find params[:selected_flight]
    @booking = Booking.new
    params[:num_passengers].to_i.times { @booking.passengers.build }
  end
end
