class TrailsGuide
  attr_reader :location,
              :forecast,
              :trails,
              :id
  def initialize(forecast, trails)
    @location = forecast.location
    @forecast = format_forecast(forecast)
    @trails = trails
    @id = nil
  end

  private
  def format_forecast(forecast)
    {
      summary: forecast.current[:weather].first[:description],
      temperature: forecast.current[:temp]
    }
  end
end
