class Forecast
  attr_reader :temp,
              :feels_like,
              :temp_min,
              :temp_max,
              :humidity,
              :weather,
              :dt_txt,
              :dt,
              :rain,
              :snow
  def initialize(weather_data)
    @temp = weather_data[:main][:temp]
    @feels_like = weather_data[:main][:feels_like]
    @temp_min = weather_data[:main][:temp_min]
    @temp_max = weather_data[:main][:temp_max]
    @humidity = weather_data[:main][:humidity]
    @weather = weather_data[:weather][0]
    @dt_txt = weather_data[:dt_txt]
    @dt = weather_data[:dt]
    @rain = weather_data[:rain] ? weather_data[:rain][:"3h"] : 0
    @snow = weather_data[:snow] ? weather_data[:snow][:"3h"] : 0
  end
end
