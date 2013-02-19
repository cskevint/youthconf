class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def is_logged_in
    not session[:user_id].nil?
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = User.new
    end
  end

  helper_method :is_logged_in
  helper_method :current_user
end
