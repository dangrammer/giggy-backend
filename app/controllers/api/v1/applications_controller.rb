class Api::V1::ApplicationsController < ApplicationController

  def index
    render json: ApplicationSerializer.new(Application.all)
  end

  private

  def application_params
    params.permit(:applicant_id, :listing_id)  
  end

end
