require 'rails_helper'

describe 'MapQuestResults PORO' do
  it 'retuns a location object' do
    location_arg = 'denver, co'
    location = MapQuestResults.new.get_coordinates(location_arg)
    expect(location.class).to eq(Location)
    expect(location.name).to eq('Denver, CO')
  end
end
