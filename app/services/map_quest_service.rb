class MapQuestService
  def get_coordinates(location)
    resp = conn.get do |req|
      req.params['location'] = location
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
