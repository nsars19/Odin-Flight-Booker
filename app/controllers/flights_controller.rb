class FlightsController < ApplicationController  
  def index
    @flights = Flight.all
    @years = @flights.map { |f| f.flight_date.year }.uniq.sort
    @days = @flights.map { |f| prepend_zero f.flight_date.day }.uniq.sort
    
    @months = @flights.map do |f|
      [Date::MONTHNAMES[f.flight_date.month], prepend_zero(f.flight_date.month)]
    end.uniq.sort { |a, b| a[1] <=> b[1] }

    @available_flights = 
      Flight.where(from_airport_id: params[:from_airport_id],
                     to_airport_id: params[:to_airport_id])
            .on_date("#{params[:flight_year]}-#{
                        params[:flight_month]}-#{
                        params[:flight_day]}")
                              

    @airports = Airport.all.map { |a| [a.name, a.id] }
  end

  private
  
  def prepend_zero nums
    return nums.map { |i| prepend_zero i } if nums.is_a? Array

    nums.to_s.length == 1 ? nums = "0#{nums}" : nums.to_s
  end
end
