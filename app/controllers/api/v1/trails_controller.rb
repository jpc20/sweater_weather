class Api::V1::TrailsController < ApplicationController
  def index
    location = MapQuestResults.new.get_coordinates(params[:location])
    forecast = OpenWeatherResults.new.get_forecast(location)
    trails = HikingProjectResults.new.get_trails(location)
    TrailsGuide.new(forecast,trails)
    require "pry"; binding.pry
  end
end
