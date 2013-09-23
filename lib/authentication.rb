module Authentication
  def current_user
    @current_user ||= User.find_by_id(session[:current_user_id]) if session[:current_user_id]
  end

  def redirect_to_signup
    redirect_to signup_path unless current_user
  end

  def login user
    session[:current_user_id] = user.id
  end
end
