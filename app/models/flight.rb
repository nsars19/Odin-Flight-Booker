class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport"   
  belongs_to :to_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings
  
  scope :on_date, ->(date) { where("flight_date = ?", date) }
  scope :coming_from, ->(from_id) { where("from_airport_id = ?", from_id) }
  scope :going_to, ->(to_id) { where("to_airport_id = ?", to_id) }
end
