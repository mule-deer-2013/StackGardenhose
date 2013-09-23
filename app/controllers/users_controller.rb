class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login @user
      redirect_to @user
    else
      flash.now[:error] = "Invalid signup"
      # puts @user.errors
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end


