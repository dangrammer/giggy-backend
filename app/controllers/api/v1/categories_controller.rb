class Api::V1::CategoriesController < ApplicationController

  def index
    render json: CategorySerializer.new(Category.all)
  end

  private

  def category_params
    params.permit(:name)
  end

end
