class PostsController < ApplicationController

  def new
  	@user = current_user
    @post = Post.new(params[:post])
  end

  def create
  	@post = Post.new(params[:post])
  	@post_user_id = current_user_id
  	if @post.save
  	  flash[:notice] = "Post was published"
  	else
  	  flash[:alert] = "Post was not published"
  	end
  	redirect_to root_path
  end

  def index
  	@posts = Post.where(user_id: params[:user_id])
  end

  def show
  	params = {"user_id" =>"1", "id"=>"1"}
  	@post = Post.find(params[:id])
  end

end