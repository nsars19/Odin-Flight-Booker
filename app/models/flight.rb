class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport"   
  belongs_to :to_airport, class_name: "Airport"
  
  def self.find_flights form_params
    from_id = form_params["from_airport"]["id"]
    to_id   = form_params["to_airport"]["id"]
    flights = Flight.where(from_airport_id: from_id, to_airport_id: to_id)
    
    date = "#{form_params["year"]}-#{form_params["month"]}-#{form_params["day"]}"
    flights.filter { |flight| flight.start.to_date.to_s == date }
    end
end
