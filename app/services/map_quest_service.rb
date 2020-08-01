class MapQuestService

  def get_coordinates(location)
  
  end

  private

  def conn
    Faraday.new('http://www.mapquestapi.com/directions/v2/route') do |f|
      f.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end
end
