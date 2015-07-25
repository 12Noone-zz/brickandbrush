class SessionsController < ApplicationController

  def show
  end

  def create
    @user = User.find_by(username: user_params[:username])

    if @user && @user.authenticate(user_params[:password])
      login!(@user)
      redirect_to '/'
    else
      flash[:message] = "Username or Password error, kiddo."
      redirect_to new_session_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
