class Api::V1::RoadTripController < ApplicationController
  def create
    directions = MapQuestResults.new.directions(from_to)
    location = MapQuestResults.new.get_coordinates(from_to[:destination])
    forecast = OpenWeatherResults.new.get_forecast(location)
    road_trip = RoadTrip.new(from_to, directions, forecast)
    require "pry"; binding.pry
    render json: RoadTripSerializer.new(road_trip)
  end

  private
  def from_to
    params.require(:body).permit(:origin, :destination)
  end
end
