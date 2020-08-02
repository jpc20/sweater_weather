require 'rails_helper'

describe 'The backgrounds endpoint' do
  it 'retuns the url to a background image for a city' do
    get '/api/v1/backgrounds', params: {location: 'denver,co'}

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
  it 'retuns the url to a background image for a differentcity' do
    get '/api/v1/backgrounds', params: {location: 'san francisco, ca'}

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end
