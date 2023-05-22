class UsersController < ApplicationController
  before_action :find_user_by_id, only: %i[edit update]
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def edit; end

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

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def dashboard
    @user = current_user
    @tickets = Ticket.where(user: @user)
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

  def find_user_by_id
    @user = User.find(params[:id])
  end
end
