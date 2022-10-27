class SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])
    
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'ログインしました。'
    else
      @error_message = '入力内容に誤りがあります。'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'ログアウトしました。'
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end

end
