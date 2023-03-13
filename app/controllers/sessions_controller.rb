class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to tasks_path, status: :see_other
    else
      flash.now[:danger] = 'メールアドレスかパスワードが間違っています。'
      render 'new', status: :unprocessable_entity
    end
  end
  
  def destroy
    log_out
    redirect_to login_path, status: :see_other
  end
end
