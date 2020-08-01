class Forecast
  attr_reader :current
  def initialize(weather_data)
    @current = get_current_weather(weather_data)
  end

  private
  def get_current_weather(weather_data)
    weather_data[:current].without(
                                    :dew_point,
                                    :wind_speed,
                                    :pressure,
                                    :wind_deg,
                                    :clouds
                                  )
  end
end
