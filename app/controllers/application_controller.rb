class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :set_locale

  def set_locale
    I18n.locale = :en
  end

  def set_current_user
    return unless session[:user_id]

    current_user
  end

  def require_user_signed_in
    redirect_to signin_path, alert: I18n.t('access.need_signup_for_access') if current_user.nil?
  end

  def already_signed_in
    redirect_to root_path, alert: I18n.t('access.user_already_signed_in') unless current_user.nil?
  end
end
