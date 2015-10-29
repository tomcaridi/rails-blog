class PostsController < ApplicationController

  def new
  	@user = current_user
    @post = Post.new
  end

  def create
    body = params[:post][:body]
    id = session[:user_id]
    @Post = Post.create(body: body, user_id: id)
    redirect_to root_path
  	# if @post.save
  	#   flash[:notice] = "Post was published"
   #    redirect_to user_path
  	# else
  	#   flash[:alert] = "Post was not published"
   #    redirect_to :back
  	# end
  end

  def index
  	@post = Post.all
  end

  def show
  	@post = Post.find(params[:id])
    redirect_to user_path
  end

end