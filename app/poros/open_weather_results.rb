class OpenWeatherResults
  def get_forecast(lat_lng)
    weather_data = OpenWeatherService.new.get_forecast(lat_lng)
    Forecast.new(weather_data)
  end
end
