class MapQuestResults
  def get_coordinates(location)
    map_quest_resp = MapQuestService.new.get_coordinates(location)
    Location.new(map_quest_resp)
  end

  def distance_to_trail(trail_data, start_location)
    formatted_trail_data = trail_data[:latitude].to_s + ',' + trail_data[:longitude].to_s
    formatted_start_location = start_location.lat_lng[:lat].to_s + ',' + start_location.lat_lng[:lng].to_s
    map_quest_resp = MapQuestService.new.distance_to_trail(formatted_trail_data, formatted_start_location)
    map_quest_resp[:route][:distance]
  end
end
