# -*- encoding : utf-8 -*-

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    before_action :complete_request?, only: %(create)
    before_action :resource_exists?, only: %(create)
    before_action :resource_authenticated?, only: %(create)

    def create
      sign_in(resource_name, resource)
      new_session
    end

    def destroy
      sign_out(resource_name)
      head :no_content
    end

    protected

    def complete_request?
      error_json(400) unless %i(email password).all? { |key| params[key].present? }
    end

    def resource_authenticated?
      error_json(401) unless resource.valid_password?(params[:password])
    end

    def resource_exists?
      error_json(410) unless resource
    end

    def error_json(status)
      warden.custom_failure!
      render json: {}, status: status
    end

    def resource
      @resource ||= User.find_for_database_authentication(email: params[:email])
    end

    def new_session
      render json: JSON.generate(resource.to_h), status: 201
    end

  end
end
