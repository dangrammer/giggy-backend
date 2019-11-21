class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes(
    :username, 
    :password_digest, 
    :first_name, 
    :last_name, 
    :full_name, #instance method from User class
    :city, 
    :state, 
    :zip_code, 
    :location, #instance method from User class
    :principal_role, 
    :principal_instrument, 
    :bio, 
    :credits, 
    :image_url, 
    :website_url,
    :member_since, #instance method from User class
    :listings_posted, #instance method from User class
    :listings_applied_to #instance method from User class
  )

  has_many :listings
  has_many :applications, :foreign_key => 'applicant_id'
  # this association exists but is not useful 
    # has_many :categories, through: :listings
  # this association exists but is not properly configured through AR
  # and is replaced by listings_applied_to method below 
    # has_many :listings, through: :applications 
end
