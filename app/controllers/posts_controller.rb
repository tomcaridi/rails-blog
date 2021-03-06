class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
  	@user = current_user
    @post = Post.new
  end

  def create
    body = params[:post][:body]
    id = session[:user_id]
    @post = Post.create(body: body, user_id: id)
    redirect_to user_path(id)
  end

  def edit
  end

  def update
    @user = @post.user
    @post.update(body: params[:post][:body])
    redirect_to user_path(@user), notice: "Sucessfully updated post."
  end

  def show
    @comment = Comment.new
    redirect_to user_path(@user)
  end

  def destroy
    @post.destroy
    id = session[:user_id]
    redirect_to user_path(id), notice: "Post successfully deleted."
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end