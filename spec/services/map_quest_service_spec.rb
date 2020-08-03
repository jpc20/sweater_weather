require 'rails_helper'

describe 'MapQuestService' do
  it 'returns location data', :vcr do
    response = MapQuestService.new.get_coordinates('denver, co')
    expect(response).to have_key(:results)
    expect(response[:results].first).to have_key(:locations)
  end
end
