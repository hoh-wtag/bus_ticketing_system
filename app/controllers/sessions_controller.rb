class SessionsController < ApplicationController
  def new
    already_signed_in
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = t(:successful_sign_in)
      redirect_to root_path
    else
      flash.now[:alert] = t(:wrong_email_password)
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = t(:signed_out)
    redirect_to root_path
  end
end
