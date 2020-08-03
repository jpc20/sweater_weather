class MapQuestService
  def get_coordinates(location)
    resp = conn.get('/geocoding/v1/address') do |req|
      req.params['location'] = location
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  def distance_to_trail(trail_data, location)
    resp = conn.get('/directions/v2/route') do |req|
      req.params['from'] = location
      req.params['to'] = trail_data
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('http://www.mapquestapi.com') do |f|
      f.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end
end
