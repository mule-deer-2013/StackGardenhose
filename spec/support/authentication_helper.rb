module AuthenticationHelper
  def login(user=true)
    ApplicationController.any_instance.stub(:current_user) { user }
  end
end
