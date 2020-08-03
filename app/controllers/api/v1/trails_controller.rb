class Api::V1::TrailsController < ApplicationController
  def index
    location = MapQuestResults.new.get_coordinates(params[:location])
    if location.name.split(',')[0] != ''
      forecast = OpenWeatherResults.new.get_forecast(location)
      trails = HikingProjectResults.new.get_trails(location)
      trails_guide = TrailsGuide.new(forecast,trails)
      render json: TrailsGuideSerializer.new(trails_guide)
    else
      render json: ErrorSerializer.new.location_error, status: :bad_request
    end
  end
end
