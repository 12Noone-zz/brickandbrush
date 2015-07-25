class FavoritesController < ApplicationController

  def show
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
		@favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.post_id = @post.id
    @favorite.save
		redirect_to @current_user
	end


  def destroy
		@favorite = Favorite.find(params[:id])
		@favorite.destroy
    redirect_to current_user
		end
  end
