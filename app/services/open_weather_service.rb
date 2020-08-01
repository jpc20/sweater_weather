class OpenWeatherService
  def get_forecast(location)
    resp = conn.get('onecall') do |req|
      req.params['lat'] = location.lat_lng[:lat]
      req.params['lon'] = location.lat_lng[:lng]
      req.params['exclude'] = 'minutely'
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('http://api.openweathermap.org/data/2.5/') do |faraday|
      faraday.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
      faraday.params['units'] = 'imperial'
    end
  end

end
