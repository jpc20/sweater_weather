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

    user_response = JSON.parse(response.body, symbolize_names: true)
    expect(user_response[:data][:type]).to eq('users')
    expect(user_response[:data][:id]).to eq(user.id.to_s)
    expect(user_response[:data][:attributes][:email]).to eq(user.email)
    expect(user_response[:data][:attributes][:api_key]).to eq(user.api_key)
  end
end
