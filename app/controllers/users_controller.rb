class UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]

  def index
    render json: UserSerializer.new(User.all).serialized_json
  end

  def create
    user = User.create(user_params)
    if user.valid?
      token = encode_token({user_id: user.id})
      render json: {user: UserSerializer.new(user).serialized_json, jwt: token}, status: :created
    else
      render json: {errors: 'Failed to create user'}, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username, 
      :first_name, 
      :password,
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
