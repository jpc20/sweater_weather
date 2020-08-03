require 'rails_helper'

describe 'The trails endpoint' do
  it 'retuns the forecast for a city and list of trails' do
    get '/api/v1/forecast', params: {location: 'denver,co'}

    expect(response).to be_successful
    expect(response.status).to eq(200)

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast[:data][:type]).to eq('trail')
    expect(forecast[:data][:attributes][:location]).to eq('Denver, CO US')
    expect(forecast[:data][:attributes][:trails].class).to eq(Array)
    expect(forecast[:data][:attributes][:trails].first).to have_key(:name)
    expect(forecast[:data][:attributes][:trails].first).to have_key(:summary)
    expect(forecast[:data][:attributes][:trails].first).to have_key(:difficulty)
    expect(forecast[:data][:attributes][:trails].first).to have_key(:location)
    expect(forecast[:data][:attributes][:trails].first).to have_key(:distance_to_trail)
  end
end
