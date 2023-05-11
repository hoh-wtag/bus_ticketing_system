class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    return unless session[:user_id]

    Current.user = User.find_by(id: session[:user_id])
  end

  def require_user_signed_in
    redirect_to signin_path, alert: t(:need_signup_for_access) if Current.user.nil?
  end

  def already_signed_in
    redirect_to root_path, alert: t(:user_already_signed_in) unless Current.user.nil?
  end
end
