class OpenWeatherResults
  def get_forecast(location)
    weather_data = OpenWeatherService.new.get_forecast(location)
    Forecast.new(weather_data)
  end
end
