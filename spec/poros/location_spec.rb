require 'rails_helper'

describe 'Location PORO' do
  it 'has a name and lat_lng' do
    location = MapQuestResults.new.get_coordinates('denver, co')
    expect(location.name).to eq('Denver, CO US')
    expect(location.lat_lng).to eq({:lat=>39.738453, :lng=>-104.984853})
  end
end
