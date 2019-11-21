class ListingsController < ApplicationController
  def index
    render json: ListingSerializer.new(Listing.all).serialized_json
  end
end
