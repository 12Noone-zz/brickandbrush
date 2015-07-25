class Post2sController < ApplicationController
before_action :require_current_user


	def index
		@post2 = Post2.all
	end

	def new
		@post2 = Post2.new
	end

	def create
		@post2 = Post2.new(post_params)
		@post2.user = current_user

		# OR: FANCYPANTS WAY
  		# @post2 = Post2.new(post_params.merge({
  		# 	user: current_user
  		# }))

	  	respond_to do |format|
	    	if @post2.save
	      		format.html  { redirect_to('/post2s',
	                    :notice => 'Post2 was successfully created.') }
	      		format.json  { render :json => @post,
	                    :status => :created, :location => @post2 }
	    	else
	      		format.html  { render :action => "new" }
	      		format.json  { render :json => @post2.errors,
	                    :status => :unprocessable_entity }
	    	end
	  	end
	end

	def show
		@post2 = Post2.find(params[:id])
		respond_to do |format|
      		format.html  # show.html.erb
      		format.json  { render :json => @post2 }
      	end
	end

	def edit
		@post2 = Post2.find(params[:id])
	end

	def update
		@post2 = Post2.find(params[:id])

		respond_to do |format|
			if @post2.update_attributes(post_params)
				format.html {redirect_to(@post2,
					:notice => 'Post2 was successfully updated')}
				format.json {head :no_content}
			else
				format.html {render :action => "edit"}
				format.json {render :json => @post2.errors,
					:status => :unprocessable_entity}
			end
		end
	end

	def destroy
		@post2 = Post2.find(params[:id])
		@post2.destroy

		respond_to do |format|
			format.html {redirect_to post2s_url}
		end
	end



	  private

 	def post_params
 		params.require(:post2).permit(:title, :image, :location, :map)
 	end
end
