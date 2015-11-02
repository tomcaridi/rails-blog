class CommentsController < ApplicationController

  def create
    @user = session[:user_id]
  	@comment = Comment.create(user_id: session[:user_id], post_id: params[:post_id], body: params[:comment][:body])
  	# @comment.user_id = session[:user_id]
  	# @comment.post_id = params[:id]
  	# if @comment.save
  	# 	flash[:notice] = "Comment posted"
  	# else
  	# 	flash[:alert] = "Comment not saved"
  	# end
    redirect_to :back, notice: "Comment posted."
  end

  def destroy
    @comment.destroy
    id = session[:user_id]
    render :new, notice: "Comment deleted."
  end
end