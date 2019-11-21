class ApplicationSerializer
  include FastJsonapi::ObjectSerializer

  attributes :applicant_id, :listing_id

  has_one :applicant, :class_name => 'User'
  has_one :listing
end
