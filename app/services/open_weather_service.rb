class OpenWeatherService

  def get_forcast(lat_lng)
    resp = conn.get do |req|
      req.params['lat'] = lat_lng[:lat]
      req.params['lon'] = lat_lng[:lng]
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('http://api.openweathermap.org/data/2.5/forecast') do |faraday|
      faraday.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
    end
  end

end
