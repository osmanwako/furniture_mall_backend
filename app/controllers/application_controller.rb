class ApplicationController < ActionController::API
  before_action :authenticate_user!
  # include ActionController::MimeResponds
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name role profile])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[full_name role profile])
  end

  def current_user
    current_user = nil
    if request.headers["Authorization"].present?
      jwt_payload = JWT.decode(request.headers["Authorization"].split(" ").last, Rails.application.credentials.secret_key_base).first
      current_user = User.find(jwt_payload["sub"])
    end
    current_user
  end
end
