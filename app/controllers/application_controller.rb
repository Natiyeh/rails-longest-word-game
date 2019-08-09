class ApplicationController < ActionController::Base
#make user available to all controllers
  private
  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end
end

  # helper_method :current_user

