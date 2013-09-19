class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #log_in_user #in sessions helper
      session[:current_user_id] = user.id
      redirect_to user_path(user) 
    else
      #create an error message and have them try signing in again
      render :new
    end

  end

  def destroy
    session.clear
    redirect_to signin_path
  end
end
