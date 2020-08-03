require 'rails_helper'

describe 'OpenWeatherService' do
  it 'returns weather data', :vcr do
    location = MapQuestResults.new.get_coordinates('denver,co')
    response = OpenWeatherService.new.get_forecast(location)
    expect(response).to have_key(:current)
    expect(response).to have_key(:hourly)
    expect(response).to have_key(:daily)
  end
end
