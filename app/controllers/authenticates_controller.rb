class AuthenticatesController < ApplicationController
  def index
    if request.headers["Authorization"].present?
      jwt_payload = JWT.decode(request.headers["Authorization"].split(" ").last, Rails.application.credentials.secret_key_base).first
      current_user = User.find(jwt_payload["sub"])

      render json: { user: { role: current_user.role, email: current_user.email, jti: current_user.jti } }, status: :ok
    else
      render json: { user: { role: "Uknown", email: "", jti: "" } }, status: :unauthorized
    end
  end
end
