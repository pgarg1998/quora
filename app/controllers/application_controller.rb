class ApplicationController < ActionController::Base
	  before_action :authenticate_user!
      before_filter :configure_permitted_parameters, if: :devise_controller?

protected

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname,:email,:password,:password_confirmation,:current_password])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname,:email,:password,:password_confirmation,:current_password])

    end

    
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
