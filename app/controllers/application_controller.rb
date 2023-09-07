class ApplicationController < ActionController::API
  before_action :authenticate_user!
  # include ActionController::MimeResponds
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name role profile])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[full_name role profile])
  end

end
