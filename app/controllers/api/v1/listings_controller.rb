class Api::V1::ListingsController < ApplicationController
  
  def index
    render json: ListingSerializer.new(Listing.all)
  end

  private

  def listing_params
    params.permit(
      :subject, 
      :description, 
      :date, 
      :end_date, 
      :city, 
      :state, 
      :zip_code, 
      :paying, 
      :user_id, 
      :category_id
    ) 
  end

end
