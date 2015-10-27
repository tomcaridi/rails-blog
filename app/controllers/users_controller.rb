class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Welcome young grasshopper!"
  	else 
  		flash[:alert] ="There was a problem creating your account. Try again!"
  	end
  	redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end