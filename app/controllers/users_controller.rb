class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password_digest]
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      flash.now[:error] = "Invalid signup"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
