require 'rails_helper'

describe 'The backgrounds endpoint' do
  it 'retuns the url to a background image for a city', :vcr do
    get '/api/v1/backgrounds', params: {location: 'denver,co'}

    expect(response).to be_successful
    expect(response.status).to eq(200)

    image = JSON.parse(response.body, symbolize_names: true)

    expect(image[:data][:type]).to eq('image')
    expect(image[:data][:attributes]).to have_key(:url)
  end
  it 'retuns the url to a background image for a differentcity', :vcr do
    get '/api/v1/backgrounds', params: {location: 'san francisco, ca'}

    expect(response).to be_successful
    expect(response.status).to eq(200)

    image = JSON.parse(response.body, symbolize_names: true)

    expect(image[:data][:type]).to eq('image')
    expect(image[:data][:attributes]).to have_key(:url)
  end
end
