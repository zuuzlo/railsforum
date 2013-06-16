class SessionsController < ApplicationController
  def new
  end

  def create
    # 1. got a User object
    # 2. called authenticate method with password

    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome, you're logged in."
    else
      flash[:error] = "There is something wrong with your username or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You've logged out."
  end
end