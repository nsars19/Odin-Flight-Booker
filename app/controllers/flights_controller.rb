class FlightsController < ApplicationController
  def index
    @airports = Airport.select(:name, :id)   
    @airport_options = @airports.map { |a| [a.name, a.id] }

    @flights = Flight.find_flights
  end

  private

  def flight_params
    params.require(:flight).permit(:from_airport, 
                                   :to_airport, 
                                   :num_passengers,
                                   :date)
  end
end
