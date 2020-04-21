class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: :create

  def index
    render json: UserSerializer.new(User.order(:username))
  end

  def profile
    render json: {user: UserSerializer.new(current_user)}, status: :accepted
  end

  def create
    user = User.create(user_params)
    if user.valid?
      token = encode_token({user_id: user.id})
      render json: {user: UserSerializer.new(user), token: token}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :not_acceptable #? why not working ?
    end
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user)
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.valid?
      render json: UserSerializer.new(user)
    else
      render json: {errors: 'Failed to update user.'}, status: :not_acceptable
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {success: 'User Deleted'}
  end

  private

  def user_params
    params.permit(
      :username, 
      :password,
      :first_name, 
      :last_name, 
      :city, 
      :state, 
      :zip_code, 
      :principal_role, 
      :principal_instrument, 
      :bio, 
      :credits, 
      :image_url, 
      :website_url,
    )
  end

end
