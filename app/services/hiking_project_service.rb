class HikingProjectService
  def get_trails(location)
    resp = conn.get do |req|
      req.params['lat'] = location.lat_lng[:lat]
      req.params['lon'] = location.lat_lng[:lng]
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('https://www.hikingproject.com/data/get-trails') do |f|
      f.params['key'] = ENV['HIKING_PROJECT_KEY']
    end
  end
end
