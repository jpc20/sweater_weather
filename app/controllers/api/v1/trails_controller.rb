class Api::V1::TrailsController < ApplicationController
  def index
    location = MapQuestResults.new.get_coordinates(params[:location])
    if location.name.split(',')[0] != ''
      render json: TrailsGuideSerializer.new(trails_guide(location))
    else
      render json: ErrorSerializer.new.location_error, status: :bad_request
    end
  end

  private

  def trails_guide(location)
    forecast = OpenWeatherResults.new.get_forecast(location)
    trails = HikingProjectResults.new.get_trails(location)
    TrailsGuide.new(forecast,trails)
  end
end
