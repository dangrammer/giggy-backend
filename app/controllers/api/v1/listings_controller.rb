class Api::V1::ListingsController < ApplicationController
  
  def index
    listings = Listing.order(created_at: :desc)
    render json: ListingSerializer.new(listings)
  end

  def create
    listing = Listing.create(listing_params)
    if listing.valid?
      render json: ListingSerializer.new(listing), status: :created
    else
      errors = listing.errors.full_messages.filter {|m| m != 'Category must exist'}
      render json: {errors: errors}, status: :not_acceptable
    end
  end

  def show
    listing = Listing.find(params[:id])
    render json: ListingSerializer.new(listing)
  end

  def update
    listing = Listing.find(params[:id])
    listing.update(listing_params)
    if listing.valid?
      render json: ListingSerializer.new(listing)
    else
      render json: {errors: listing.errors.full_messages}, status: :not_acceptable
    end
  end

  def destroy
    listing = Listing.find(params[:id])
    listing.destroy
    render json: {success: 'Listing Deleted'}
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
