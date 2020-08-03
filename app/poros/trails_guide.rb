class TrailsGuide
  attr_reader :location,
              :forecast,
              :trails
  def initialize(forecast, trails)
    @location = forecast.location
    @forecast = format_forecast(forecast)
    @trails = trails
  end

  private
  def format_forecast(forecast)
    {
      summary: forecast.current[:weather].first[:description],
      temerature: forecast.current[:temp]
    }
  end
end
