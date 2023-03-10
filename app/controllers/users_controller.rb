class UsersController < ApplicationController
  before_action :require_login, only: [:show, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to tasks_path, status: :see_other
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    current_user.destroy
    redirect_to signup_path, status: :see_other
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
