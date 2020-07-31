class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.datetime :start
      t.datetime :finish
      t.integer :from_airport
      t.integer :to_airport
      t.timestamps
    end
  end
end
