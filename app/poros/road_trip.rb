class RoadTrip
  attr_reader :origin,
              :destination,
              :travel_time,
              :arrival_forecast,
              :id
  def initialize(from_to, directions, forecast)
    @origin = from_to[:origin]
    @destination = from_to[:destination]
    @travel_time = directions[:route][:realTime]
    @arrival_forecast = get_arrival_forecast(forecast, @travel_time)
    @id = nil
  end

  private
  def get_arrival_forecast(forecast, time)
    hours = (time / 60.0 / 60).round(0)
    forecast.hourly[hours - 1]
  end
end
