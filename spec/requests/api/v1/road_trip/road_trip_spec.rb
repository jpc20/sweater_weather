require 'rails_helper'

describe 'Road trip endpoint' do
  it 'returns the origin, destination, travel time, and destination forecast' do
    user = create(:user)
    road_trip_body = {
                        body:
                        {
                          "origin": "Denver, CO",
                          "destination": "Pueblo, CO",
                          "api_key": user.api_key
                        }
                      }
    post '/api/v1/road_trip', params: road_trip_body

    expect(response).to be_successful
    expect(response.status).to eq(200)

    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(road_trip[:data][:type]).to eq('road_trip')
    expect(road_trip[:data][:attributes]).to have_key([:origin])
    expect(road_trip[:data][:attributes]).to have_key([:destination])
    expect(road_trip[:data][:attributes]).to have_key([:travel_time])
    expect(road_trip[:data][:attributes]).to have_key([:forecast])
  end
end
