require 'rails_helper'

describe 'TrailsGuide PORO' do
  it 'has a location, forecast, and array of trails' do
    location = MapQuestResults.new.get_coordinates('denver,co')
    forecast = OpenWeatherResults.new.get_forecast(location)
    trails = HikingProjectResults.new.get_trails(location)
    trails_guide = TrailsGuide.new(forecast,trails)
    expect(trails_guide.location).to be
    expect(trails_guide.forecast).to have_key(:summary)
    expect(trails_guide.forecast).to have_key(:temperature)
    expect(trails_guide.trails.first.class).to eq(Trail)
  end
end
