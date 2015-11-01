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
    redirect_to :back, notice: "Comment created"
  end

  def destroy
  end
end