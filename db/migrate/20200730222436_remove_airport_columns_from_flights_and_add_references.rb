class RemoveAirportColumnsFromFlightsAndAddReferences < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :from_airport_id
    remove_column :flights, :to_airport_id

    add_reference :flights, :from_airport, foreign_key: true
    add_reference :flights, :to_airport, foreign_key: true
  end
end
