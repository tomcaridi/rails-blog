class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Welcome grasshopper! Now you can sign in."
  	else 
  		flash[:alert] ="There was a problem creating your account. Try again!"
  	end
  	redirect_to sign_up_path
  end
  
  def show
    @posts = @user.posts
    @comments = @user.comments
  end
  
  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user), notice: "Sucessfully updated profile."
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to user_path(@user), notice: "User successfully deleted."
  end

  def search
    search_term = params[:query]
    search_results = User.where(username: search_term)
    if (search_results.length == 0)
      redirect_to users_path, alert: "No results found"
    elsif (search_results.length == 1)
      redirect_to user_path search_results.first
    else #multiple matches
      @users = search_results
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end