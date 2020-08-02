class Api::V1::BackgroundsController < ApplicationController
  def index
    image = UnsplashResults.new.get_image(params[:location])
    render json: ImageSerializer.new(image)
  end
end
