require 'rails_helper'

describe 'The trails endpoint' do
  it 'retuns the forecast for a city and list of trails' do
    get '/api/v1/trails', params: {location: 'denver,co'}

    expect(response).to be_successful
    expect(response.status).to eq(200)

    trails_resp = JSON.parse(response.body, symbolize_names: true)

    expect(trails_resp[:data][:type]).to eq('trail')
    expect(trails_resp[:data][:attributes][:location]).to eq('Denver, CO US')
    expect(trails_resp[:data][:attributes][:forecast]).to have_key(:summary)
    expect(trails_resp[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(trails_resp[:data][:attributes][:trails].class).to eq(Array)
    expect(trails_resp[:data][:attributes][:trails].first).to have_key(:name)
    expect(trails_resp[:data][:attributes][:trails].first).to have_key(:summary)
    expect(trails_resp[:data][:attributes][:trails].first).to have_key(:difficulty)
    expect(trails_resp[:data][:attributes][:trails].first).to have_key(:location)
    expect(trails_resp[:data][:attributes][:trails].first).to have_key(:distance_to_trail)
  end

  it 'retuns the forecast  and list of trails for a different city' do
    get '/api/v1/trails', params: {location: 'san francisco'}

    expect(response).to be_successful
    expect(response.status).to eq(200)

    trails_resp = JSON.parse(response.body, symbolize_names: true)

    expect(trails_resp[:data][:type]).to eq('trail')
    expect(trails_resp[:data][:attributes][:location]).to eq('San Francisco, CA US')
    expect(trails_resp[:data][:attributes][:forecast]).to have_key(:summary)
    expect(trails_resp[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(trails_resp[:data][:attributes][:trails].class).to eq(Array)
    expect(trails_resp[:data][:attributes][:trails].first).to have_key(:name)
    expect(trails_resp[:data][:attributes][:trails].first).to have_key(:summary)
    expect(trails_resp[:data][:attributes][:trails].first).to have_key(:difficulty)
    expect(trails_resp[:data][:attributes][:trails].first).to have_key(:location)
    expect(trails_resp[:data][:attributes][:trails].first).to have_key(:distance_to_trail)
  end
end
