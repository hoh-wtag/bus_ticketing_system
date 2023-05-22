class UsersController < ApplicationController
  def new
    already_signed_in
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = I18n.t('sign_up.account_creation_successful')
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :user_name,
                                 :phone,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end
end
