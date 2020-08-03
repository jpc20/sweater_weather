class Api::V1::TrailsController < ApplicationController
  def index
    location = MapQuestResults.new.get_coordinates(params[:location])
    trails = HikingProjectResults.new.get_trails(location)
    require "pry"; binding.pry
  end
end
