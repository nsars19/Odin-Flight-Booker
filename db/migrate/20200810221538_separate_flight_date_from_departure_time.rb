class SeparateFlightDateFromDepartureTime < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :start
    remove_column :flights, :start

    add_column :flights, :flight_date, :date
    add_column :flights, :departure_time, :time
    add_column :flights, :arrival_time, :time
  end
end
