class MapQuestResults
  def get_coordinates(location)
    map_quest_resp = MapQuestService.new.get_coordinates(location)
    map_quest_resp[:results].first[:locations].first[:latLng]
  end
end
