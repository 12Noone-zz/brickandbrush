class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_comment
  helper_method :current_favorite

  @user = User.new


  private


  def logout!
    session[:current_user_id] = nil
  end

  def login!(user)
    session[:current_user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def current_comment
    @current_comment ||= Comment.find_by(id: session[:current_user_id])
  end

  def current_favorite
    @current_favorite ||= Favorite.find_by(id: session[:current_user_id])
  end

  def require_current_user
    unless current_user
      flash[:message] = "You must be signed in to do that!"
      redirect_to new_session_path
    end
  end
end
