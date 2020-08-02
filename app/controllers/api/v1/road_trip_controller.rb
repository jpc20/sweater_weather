class Api::V1::RoadTripController < ApplicationController
  def create
    directions = MapQuestResults.new.directions(from_to)
  end

  private
  def from_to
    params.require(:body).permit(:origin, :destination)
  end
end
