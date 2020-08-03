class MapQuestService
  def get_coordinates(location)
    resp = conn.get('/geocoding/v1/address') do |req|
      req.params['location'] = location
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  def directions(from_to)
    resp = conn.get('/directions/v2/route') do |req|
      req.params['from'] = from_to[:origin]
      req.params['to'] = from_to[:destination]
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('http://www.mapquestapi.com/geocoding/v1/address') do |f|
      f.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end
end
