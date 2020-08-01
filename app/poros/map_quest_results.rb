class MapQuestResults
  def get_coordinates(location)
    map_quest_resp = MapQuestService.new.get_coordinates(location)
    Location.new(map_quest_resp)
  end
end
