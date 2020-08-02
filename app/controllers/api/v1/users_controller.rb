class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UsersSerializer.new(user), status: :created
    else
      render json: ErrorSerializer.new.registration_error(user), :status => :bad_request
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
