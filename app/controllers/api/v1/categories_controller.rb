class Api::V1::CategoriesController < ApplicationController

  def index
    render json: CategorySerializer.new(Category.all).serialized_json
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
