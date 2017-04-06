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
		else
			render 'new'
		end
	end

	def show
	end

	private
		def set_post
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:rationale, :date)
		end
end
