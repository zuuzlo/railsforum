class UsersController < ApplicationController
  before_filter :require_same_user, only: [:edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_path, notice: 'You are registered!'
    else
      @user.errors.delete(:password_digest)
      render :new
    end
  end

  private

  def require_same_user
    if current_user != User.find(params[:id])
      flash[:error] = "You can't do that"
      redirect_to root_path
    end
  end
end