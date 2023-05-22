class SessionsController < ApplicationController
  def new
    already_signed_in
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = I18n.t('sign_in.successful_sign_in')
      redirect_to root_path, status: :see_other
    else
      flash.now[:alert] = I18n.t('sign_in.wrong_email_password')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = I18n.t('sign_out.signed_out')
    redirect_to root_path, status: :see_other
  end
end
