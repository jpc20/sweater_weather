require 'rails_helper'

describe 'Forecast PORO' do
  it 'has a location, current, hourly, and daily', :vcr do
    location = MapQuestResults.new.get_coordinates('denver,co')
    forecast = OpenWeatherResults.new.get_forecast(location)
    expect(forecast.location).to eq('Denver, CO US')
    expect(forecast.current).to have_key(:weather)
    expect(forecast.hourly.first).to have_key(:weather)
    expect(forecast.daily.first).to have_key(:weather)
  end
end
