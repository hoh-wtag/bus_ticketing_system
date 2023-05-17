module ApplicationHelper
  def current_user
    return unless session[:user_id]

    User.find_by(id: session[:user_id])
  end
end
