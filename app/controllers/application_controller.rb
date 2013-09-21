class ApplicationController < ActionController::Base
  protect_from_forgery
  include Authentication #see lib
  include QuestionHelper

  helper_method :current_user  #only exposes this method to views

end
