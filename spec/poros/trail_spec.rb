require 'rails_helper'

describe 'Trail PORO' do
  it 'has a name, summary, difficulty, location, and distance_to_trail' do
    location_arg = 'denver, co'
    location = MapQuestResults.new.get_coordinates(location_arg)
    trail = HikingProjectResults.new.get_trails(location).first
    expect(trail.name).to be
    expect(trail.summary).to be
    expect(trail.difficulty).to be
    expect(trail.location).to be
    expect(trail.distance_to_trail).to be
  end
end
