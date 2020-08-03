class Trail
  attr_reader :name,
              :summary,
              :difficulty,
              :location,
              :distance_to_trail
  def initialize(trail_data)
    @name = trail_data[:name]
    @summary = trail_data[:summary]
    @difficulty = trail_data[:difficulty]
    @location = trail_data[:location]
    # @distance_to_trail = calculate_travel_time(travel_data)
  end
end
