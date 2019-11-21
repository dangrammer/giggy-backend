class UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all).serialized_json
  end
end
