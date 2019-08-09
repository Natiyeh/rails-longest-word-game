class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_userid(params[:userid])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice:
      "Welcome #{user.id}, you successfully signed in."
    else
      render 'new', alert:
      "user ID and/or password invalid."
    end
  end
end
