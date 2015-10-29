class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.all
  end

  def new
  	@user = current_user
    @post = Post.new
  end

  def create
    body = params[:post][:body]
    id = session[:user_id]
    @Post = Post.create(body: body, user_id: id)
    redirect_to user_path(id)
  	# if @post.save
  	#   flash[:notice] = "Post was published"
   #    redirect_to user_path
  	# else
  	#   flash[:alert] = "Post was not published"
   #    redirect_to :back
  	# end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    puts "*" *25
    puts params
    @post = Post.find(params[:id])
    @user = @post.user
    @post.update(body: params[:post][:body])
    redirect_to user_path(@user), notice: "Sucessfully updated post."
  end

  def show
  	@post = Post.find(params[:id])
    redirect_to user_path
  end

  def destroy
    @post.destroy
    puts "HI !!! "
    id = session[:user_id]
    redirect_to user_path(id), notice: "Post successfully deleted."
  end

  private
  def set_post
      @post = Post.find(params[:id])
  end

  def user_params
    params.require(:post).permit(:body)
  end
end