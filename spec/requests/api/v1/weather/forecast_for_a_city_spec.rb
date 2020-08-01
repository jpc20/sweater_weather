require 'rails_helper'

describe 'The forcast endpoint' do
  it 'retuns the weather for a city' do
    get '/api/v1/forecast', params: {location: 'denver,co'}

    expect(response).to be_successful
    expect(response.status).to eq(200)

    forecast = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
    expect(forecast[:data][:type]).to eq('forecast')
    expect(forecast[:data][:attributes][:location]).to eq('Denver, CO US')
    expect(forecast[:data][:attributes]).to have_key(:current)
    expect(forecast[:data][:attributes]).to have_key(:hourly)
    expect(forecast[:data][:attributes]).to have_key(:daily)
  end
end
