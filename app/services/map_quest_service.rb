class MapQuestService

  def get_coordinates(location)

  end

  private

  def conn
    gsFaraday.new('http://www.mapquestapi.com/directions/v2/route') do |f|
    gs  f.params['key'] = ENV['MAPQUEST_API_KEY']
    gsend
  end
end
