class CategorySerializer
  include FastJsonapi::ObjectSerializer

  attributes :name

  has_many :listings

  # this association exists but is not useful
  # has_many :users, through: :listings
  
end
