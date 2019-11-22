class Api::V1::ApplicationsController < ApplicationController

  def index
    render json: ApplicationSerializer.new(Application.all).serialized_json
  end

  private

  def application_params
    params.require(:application).permit(:applicant_id, :listing_id)  
  end

end
