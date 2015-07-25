class CommentsController < ApplicationController
 	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
    	@comment.name = current_user.username
    	@comment.save
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		respond_to do |format|
			format.html {redirect_to @post}
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:name, :content)
		end
end
