class Application < ApplicationRecord
  belongs_to :applicant, :class_name => 'User'
  belongs_to :listing
end
