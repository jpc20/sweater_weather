class OpenWeatherResults
  def get_forcast(lat_lng)
    OpenWeatherService.new.get_forcast(lat_lng)
  end
end
