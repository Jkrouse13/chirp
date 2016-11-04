class ApplicationController < ActionController::API

  private

  def current_user
    @current_user ||= User.find_by(api_token: params[:api_token])
  end

  def require_logged_in
    if !current_user
      render json: ["You must be logged in to do this!!!"], status: :forbidden
    end
  end
end
