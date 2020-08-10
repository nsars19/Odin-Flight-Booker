# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Airport.delete_all unless Airport.any?
Flight.delete_all

airports = [
  {name: "Boston", code: "BOS"},
  {name: "Los Angeles", code: "LAX"},
  {name: "O'Hare", code: "ORD"},
  {name: "Atlanta", code: "ATL"},
  {name: "Dallas/Fort Worth", code: "DFW"},
  {name: "Denver", code: "DEN"},
  {name: "John F Kennedy", code: "JFK"},
  {name: "San Francisco", code: "SFO"},
  {name: "Seattle-Tacoma", code: "SEA"},
  {name: "McCarran", code: "LAS"}
]

def random_date
  Time.now + rand(13).month + 
             rand(31).day +
             rand(13).hour + 
             rand(60).minute +
             rand(60).second
end

def random from = 21, to = 30
  rand from..to
end

def create_flights
  flights = []

  20000.times do
    start = random_date
    finish = start + random(2, 12).hour + rand(60).minute

    flights << {flight_date: Date.parse(start.to_s), 
                departure_time: start.strftime("%H:%M"),
                arrival_time: finish.strftime("%H:%M"),
                from_airport_id: random, 
                to_airport_id: random}
  end
  
  flights.each { |flight| Flight.create flight }
end

create_flights
airports.each { |airport| Airport.create airport } unless Airport.any?