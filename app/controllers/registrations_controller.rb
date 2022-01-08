class RegistrationsController < Devise::RegistrationsController
  respond_to :json
  skip_before_action :verify_authenticity_token, :only => :create

  def create
    build_resource(sign_up_params)
    resource.save
    render json: resource, status: :created
  end
end