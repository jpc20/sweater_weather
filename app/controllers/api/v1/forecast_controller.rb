class Api::V1::ForecastController < ApplicationController
  def index
    lat_lng = MapQuestResults.new.get_coordinates(params[:location])
    forecast = OpenWeatherResults.new.get_forecast(lat_lng)
    render json: ForecastSerializer.new(forecast)
  end
end
