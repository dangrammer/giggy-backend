class Api::V1::ListingsController < ApplicationController
  
  def index
    render json: ListingSerializer.new(Listing.all).serialized_json
  end

  private

  def listing_params
    params.require(:listing).permit(
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
