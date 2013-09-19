class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password_digest])
      #log_in_user #in sessions helper
      session[:user_id] = user.id
      redirect_to user_path 
    else
      #create an error message and have them try signing in again
      render :new
    end

  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
