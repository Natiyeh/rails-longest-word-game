class UsersController < ApplicationController
  def new; end

  def create
    user = User.create(create_params)
    byebug
  end

  private

  def create_params
    params.permit(:email, :password)
  end
end
