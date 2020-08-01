require 'rails_helper'

describe 'The forcast endpoint' do
  it 'retuns the weather for a city' do
    get '/api/v1/forecast', params: {location: 'denver,co'}

    expect(response).to be_successful
    expect(response.status).to eq(200)

  end
end
