class Location
  attr_reader :name, :lat_lng
  def initialize(location_data)
    @name = format_name(location_data)
    @lat_lng = map_quest_resp[:results].first[:locations].first[:latLng]
  end

  private
  def format_name(location_data)
    location_data[:results].first[:locations].first[:adminArea5] + ', ' + location_data[:results].first[:locations].first[:adminArea3]
  end
end
