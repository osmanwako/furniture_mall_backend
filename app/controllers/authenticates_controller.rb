class AuthenticatesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { user: current_user, signedin: true }, status: :ok
  end
end
