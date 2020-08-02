require 'rails_helper'

describe 'UnsplashService' do
  it 'returns image url' do
    response = UnsplashService.new.get_image('denver, co')
    expect(response[:results].first).to have_key(:urls)
  end
end
