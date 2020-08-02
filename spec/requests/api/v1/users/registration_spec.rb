require 'rails_helper'

describe 'users endpoint' do
  it 'returns a user response with an id, email, and api_key' do
    user_params = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password"
                  }
    post '/api/v1/users', params: user_params

    expect(response).to be_successful
    expect(response.status).to eq(201)

    user_response = JSON.parse(response.body, symbolize_names: true)
    expect(user_response[:data][:type]).to eq('users')
    expect(user_response[:data]).to have_key(:id)
    expect(user_response[:data][:attributes]).to have_key(:email)
    expect(user_response[:data][:attributes]).to have_key(:api_key)
  end

  it 'returns a 400 and description of failure' do
    user_params = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "different_password"
                  }
    post '/api/v1/users', params: user_params

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    failed_response = JSON.parse(response.body, symbolize_names: true)
  end
end
