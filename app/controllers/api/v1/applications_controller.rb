class Api::V1::ApplicationsController < ApplicationController

  def index
    render json: ApplicationSerializer.new(Application.all)
  end

  def create
    application = Application.create(application_params)
    if application.valid?
      render json: {success: 'Successfully applied'}, status: :created
    else
      render json: {errors: 'Failed to submit application'}, status: :not_acceptable
    end
  end

  private

  def application_params
    params.permit(:applicant_id, :listing_id)  
  end

end
