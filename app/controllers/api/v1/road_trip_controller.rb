class Api::V1::RoadTripController < ApplicationController
  def create
    directions = MapQuestResults.new.directions(from_to)
    location = MapQuestResults.new.get_coordinates(from_to[:destination])
    forecast = OpenWeatherResults.new.get_forecast(location)
    road_trip = RoadRoadTrip.new(from_to, directions, forecast)
    render json: RoadRoadTripSerializer.new(road_trip)
  end

  private
  def from_to
    params.require(:body).permit(:origin, :destination)
  end
end
