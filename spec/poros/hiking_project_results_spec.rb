require 'rails_helper'

describe 'HikingProjectResults PORO' do
  it 'retuns a trail objects' do
    location_arg = 'denver, co'
    location = MapQuestResults.new.get_coordinates(location_arg)
    trails = HikingProjectResults.new.get_trails(location)
    expect(trails.class).to eq(Array)
    expect(trails.first.class).to eq(Trail)
  end
end
