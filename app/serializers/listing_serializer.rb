class ListingSerializer
  include FastJsonapi::ObjectSerializer

  attributes(
    :subject, 
    :description, 
    :date, 
    :end_date, 
    :city, 
    :state, 
    :zip_code, 
    :paying, 
    :user_id, 
    :category_id,
    :poster, #instance method from Listing class
    :applicants #instance method from Listing class
  ) 

  has_one :user
  has_one :category
  has_many :applications
  # this association exists but is not configured through AR
  # has_many :applicants, through: :applications
end
