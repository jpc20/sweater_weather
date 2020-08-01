class Api::V1::ForecastController < ApplicationController
  def index
    location = MapQuestResults.new.get_coordinates(params[:location])
    forecast = OpenWeatherResults.new.get_forecast(location)
    render json: ForecastSerializer.new(forecast)
  end
end
