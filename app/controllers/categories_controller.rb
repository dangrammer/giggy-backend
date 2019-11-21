class CategoriesController < ApplicationController
  def index
    render json: CategorySerializer.new(Category.all).serialized_json
  end
end
