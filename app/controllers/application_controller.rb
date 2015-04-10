class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :track_activity

  private
  def current_user
    # binding.pry
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to root_url, notice: "Not authorized" if current_user.nil?
  end

  def track_activity(trackable)
    current_user.activities.create! action: params[:action], trackable: trackable
  end
end
