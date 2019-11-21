class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :applications
  # this association exists but is not configured through AR, the method below takes its place
  # has_many :applicants, through: :applications

  def applicants
    applicant_ids = self.applications.map {|app| app.applicant_id}
    User.all.filter {|user| applicant_ids.include?(user.id)}
  end

  def poster
    self.user
  end

end
