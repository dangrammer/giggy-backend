class ApplicationsController < ApplicationController
  def index
    render json: ApplicationSerializer.new(Application.all).serialized_json
  end
end
