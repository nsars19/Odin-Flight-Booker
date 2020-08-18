class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find params[:selected_flight]
    @passengers = Array.new params[:num_passengers].to_i, Passenger.new
  end
end
