class LocationsController < ApplicationController
  def astoria
    @posts = Post.all
    @Astoria = @posts.where("location = 'Astoria'")
    render :astoria
  end

  def eastvillage
    @posts = Post.all
    @EastVillage = @posts.where("location = 'East Village'")
    render :eastvillage
  end

  def manhattan
    @post = Post.all
    @manhattan = @post.where("location = 'Manhattan'")
    render :manhattan
  end

  def show
    @posts = Post.all
    @location = Post.find(params[:location])
  end
end
