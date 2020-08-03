class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key)
    if user
      render json: RoadTripSerializer.new(road_trip(from_to))
    else
      render json: ErrorSerializer.new.unauthorized_error, status: :unauthorized
    end
  end

  private

  def road_trip(from_to)
    directions = MapQuestResults.new.directions(from_to)
    location = MapQuestResults.new.get_coordinates(from_to[:destination])
    forecast = OpenWeatherResults.new.get_forecast(location)
    RoadTrip.new(from_to, directions, forecast)
  end

  def from_to
    JSON.parse(request.body.read, symbolize_names: true).without(:api_key)
  end

  def api_key
    JSON.parse(request.body.read, symbolize_names: true).slice(:api_key)
  end
end
