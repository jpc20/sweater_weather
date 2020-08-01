class Api::V1::ForecastController < ApplicationController
  def index
    location = MapQuestResults.new.get_coordinates(params[:location])
    
  end
end
