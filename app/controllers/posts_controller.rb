class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to @post
			flash[:notice] = "Post successfully created"
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
			flash[:notice] = "Post successfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
		flash[:notice] = "Post successfully deleted"
	end

	private
		def set_post
			@post = Post.find(params[:id])
		end

		def authenticate_admin
			redirect_to root_path unless current_user.type == "AdminUser"
		end

		def post_params
			params.require(:post).permit(:rationale, :date, :status)
		end
end
