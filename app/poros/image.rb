class Image
  attr_reader :url
  def initialize(image_data)
    @url = image_data[:results].first[:urls][:full]
  end
end
