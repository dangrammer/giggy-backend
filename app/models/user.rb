class User < ApplicationRecord
  has_secure_password
  validates :username, :first_name, :last_name, :image_url, :city, :state, :zip_code, presence: true
  validates :password, length: {in: 5..15}, on: :create
  validates :username, length: {in: 2..15}, uniqueness: {message: ': An account associated with %{value} already exists'}
  validates :first_name, :last_name, :city, :state, :zip_code, length: {in: 2..20}
  validates :bio, :credits, length: {maximum: 2000}

  has_many :messages
  has_many :user_conversations
  has_many :conversations, through: :user_conversations
  has_many :listings, dependent: :destroy
  has_many :applications, :foreign_key => 'applicant_id', dependent: :destroy
  # this association exists but is not useful 
    # has_many :categories, through: :listings
  # this association exists but is not properly configured through AR
  # and is replaced by listings_applied_to method below 
    # has_many :listings, through: :applications 

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def location
    "#{self.city}, #{self.state}"
  end

  def member_since
    self.created_at.strftime('Member since %^b %Y')
  end

  def listings_posted
    self.listings
    # alternative to AR assoc. => Listing.all.filter {|listing| listing.user == self}
  end

  def listings_applied_to
    self.applications.map {|application| application.listing}  
  end

end
