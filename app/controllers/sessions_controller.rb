class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    #ユーザーをデータベースから見つけて検証する
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      flash[:success] = "ログインしました"
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    flash[:danger] = 'ログアウトしました'
    redirect_to root_url
  end
end
