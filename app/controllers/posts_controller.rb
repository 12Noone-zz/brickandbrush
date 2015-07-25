class PostsController < ApplicationController
before_action :require_current_user, only: :new


  def index
		@posts = Post.all
	end

  def new
    @post = Post.new
  end

  def show
    @post = Post.all
    @favorite = Favorite.all
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @post }
end
  end
  #
  # def create
  #   @post = current_user.posts.new(post_params)
  #
 # 		if @post.save
 # 			redirect_to root_url
 # 		else
 # 			render :new
 # 		end
 # 	end


  def create
  @post = current_user.posts.new(post_params)

  respond_to do |format|
    if @post.save
      format.html  { redirect_to(@post,
                    :notice => 'Post was successfully created.') }
      format.json  { render :json => @post,
                    :status => :created, :location => @post }
    else
      format.html  { render :action => "new" }
      format.json  { render :json => @post.errors,
                    :status => :unprocessable_entity }
    end
  end
end

  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html  { redirect_to(@post,
                      :notice => 'Post was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @post.errors,
                      :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
  end
end

  private

 	def post_params
 		params.require(:post).permit(:title, :image, :image1, :image2, :image3, :image4, :image5, :content, :location, :maps)
 	end

end
