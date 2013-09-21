module ApplicationHelper
  def gravatar_image_source
    email = current_user.email
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}"
  end
end
