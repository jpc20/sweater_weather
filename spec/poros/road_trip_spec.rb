require 'rails_helper'

describe 'RoadTrip PORO' do
  it 'has an origin, destination, travel_time, and forecast' do
    from_to = {origin: "Denver, CO", destination: "Pueblo, CO"}
    directions = MapQuestResults.new.directions(from_to)
    location = MapQuestResults.new.get_coordinates(from_to[:destination])
    forecast = OpenWeatherResults.new.get_forecast(location)
    road_trip = RoadTrip.new(from_to, directions, forecast)

    expect(road_trip.origin).to eq 'Denver, CO'
    expect(road_trip.destination).to eq 'Pueblo, CO'
    expect(road_trip.travel_time).to be
    expect(road_trip.forecast).to be
  end
end
