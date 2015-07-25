class UsersController < ApplicationController
  before_action :fetch_user, only: :show

  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to root_path

    else
      flash[:message]=@user.errors.full_messages.to_sentence
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @user.to_json(include: :favorite_posts) }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def fetch_user
    @user = User.includes(:posts, favorites: :post).find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end
end
