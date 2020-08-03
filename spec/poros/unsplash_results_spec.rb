require 'rails_helper'

describe 'UnsplashResults PORO' do
  it 'retuns a image object', :vcr do
    location_arg = 'denver, co'
    image = UnsplashResults.new.get_image(location_arg)
    expect(image.class).to eq(Image)
    expect(image.url.first(4)).to eq('http')
  end
end
