class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer "from_airport_id"
      t.integer "to_airport_id"
      t.date "flight_date"
      t.string "departure_time"
      t.string "arrival_time"
      t.index ["from_airport_id"], name: "index_flights_on_from_airport_id"
      t.index ["to_airport_id"], name: "index_flights_on_to_airport_id"
      t.timestamps
    end
  end
end
