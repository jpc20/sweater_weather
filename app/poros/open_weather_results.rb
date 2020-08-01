class OpenWeatherResults
  def get_forcast(lat_lng)
    weather_data = OpenWeatherService.new.get_forcast(lat_lng)
    weather_data[:list].map do |data|
      Forecast.new(data)
    end
  end
end
