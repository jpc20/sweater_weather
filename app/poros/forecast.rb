class Forecast
  attr_reader :current,
              :hourly
  def initialize(weather_data)
    @current = format_current_weather(weather_data)
    @hourly = format_hourly_forecast(weather_data)
  end

  private
  def format_current_weather(weather_data)
    weather_data[:current].without(
                                    :dew_point,
                                    :wind_speed,
                                    :pressure,
                                    :wind_deg,
                                    :clouds
                                  )
  end

  def format_hourly_forecast(weather_data)
    weather_data[:hourly].map do |hourly_data|
      hourly_data.slice(:dt, :temp, :weather)
    end.first(10)
  end
end
