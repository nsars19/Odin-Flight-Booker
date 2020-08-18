class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :flight
      t.references :passenger
      
      t.timestamps
    end
  end
end
