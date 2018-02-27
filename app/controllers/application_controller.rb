class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!


private
  def require_signin
    if !current_user
      redirect_to new_session_url
    end
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  helper_method :current_user
end
