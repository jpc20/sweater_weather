class Api::V1::TrailsController < ApplicationController
  def index
    location = MapQuestResults.new.get_coordinates(params[:location])
    forecast = OpenWeatherResults.new.get_forecast(location)
    trails = HikingProjectResults.new.get_trails(location)
    trails_guide = TrailsGuide.new(forecast,trails)
    render json: TrailsGuideSerializer.new(trails_guide)
  end
end
