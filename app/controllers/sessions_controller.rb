class SessionsController < ApplicationController

  def new
  end

  def create
    puts params
  	@user = User.where(username: params[:username]).first
  	if @user
  	  if @user.password == params[:password]
  	    session[:user_id] = @user.id
  	    flash[:notice] = "You have logged in successfully"
  	  else
  	  	flash[:alert] = "Your login information was inccorect."
  	  end
  	else
  	  flash[:alert] = "Your login information was inccorect."
  	end
  	redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are signed out"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end