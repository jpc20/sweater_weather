class UnsplashService
  def get_image(location)
    resp = conn.get do |req|
      req.params['query'] = location
      req.params['count'] = 1
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new('https://api.unsplash.com/search/photos') do |f|
      f.params['client_id'] = ENV['UNSPLASH_ID']
    end
  end
end
