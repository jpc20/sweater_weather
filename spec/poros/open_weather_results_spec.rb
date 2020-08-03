require 'rails_helper'

describe 'OpenWeatherResults PORO' do
  it 'retuns a forecast object', :vcr do
    location = MapQuestResults.new.get_coordinates('denver,co')
    forecast = OpenWeatherResults.new.get_forecast(location)
    expect(forecast.class).to eq(Forecast)
  end
end
