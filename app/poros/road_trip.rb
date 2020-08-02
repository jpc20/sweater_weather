class RoadTrip
  attr_reader :origin,
              :destination,
              :travel_time,
              :forecast
  def initialize(from_to, directions, forecast)
    @origin = from_to[:origin]
    @destination = from_to[:destination]
    @travel_time = directions
    @forecast = forecast
  end
end
