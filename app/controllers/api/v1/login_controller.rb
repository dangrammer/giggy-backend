class Api::V1::LoginController < ApplicationController
  skip_before_action :authorized, only: :create

  def create
    user = User.find_by(username: user_login_params[:username])
    if user && user.authenticate(user_login_params[:password])
      token = encode_token({user_id: user.id})
      render json: {user: UserSerializer.new(user), token: token}, status: :accepted
    elsif !user
      render json: {errors: ['[!] Invalid username']}, status: :unauthorized
    elsif !user.authenticate(user_login_params[:password])
      render json: {errors: ['[!] Invalid password']}, status: :unauthorized
    end
  end

  private

  def user_login_params
    params.permit(:username, :password)
  end
end
