class Trail
  attr_reader :name,
              :summary,
              :difficulty,
              :location,
              :distance_to_trail
  def initialize(trail_data, start_location)
    @name = trail_data[:name]
    @summary = trail_data[:summary]
    @difficulty = trail_data[:difficulty]
    @location = trail_data[:location]
    @distance_to_trail = calculate_distance_to_trail(trail_data, start_location)
  end

  private
  def calculate_distance_to_trail(trail_data, start_location)
    MapQuestResults.new.distance_to_trail(trail_data, start_location)
  end
end
