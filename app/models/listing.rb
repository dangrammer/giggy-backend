class Listing < ApplicationRecord
  attr_accessor :subject, :description, :date, :end_date, :city, :state, :zip_code, 
    :paying, :user_id, :category_id,:poster, :posting_date, :applicants 
    
  belongs_to :user
  belongs_to :category
  has_many :applications, dependent: :destroy
  # this association exists but is not configured through AR, the method below takes its place
  # has_many :applicants, through: :applications

  def applicants
    applicant_ids = self.applications.map {|app| app.applicant_id}
    User.all.filter {|user| applicant_ids.include?(user.id)}
  end

  def poster
    self.user
  end

  def posting_date
    if self.created_at.year == Time.now.year
      self.created_at.strftime('%^b %-d')
    else
      self.created_at.strftime('%^b %Y')
    end
  end

end
