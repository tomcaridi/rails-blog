class CommentsController < ApplicationController

  def create
  	@comment = Comment.new(params[:comment])
  	@comment.user_id = session[:user_id]
  	@comment.post_id = params[:id]
  	if @comment.save
  		flash[:notice] = "Comment posted"
  	else
  		flash[:alert] = "Comment not saved"
  	end
  	redirect_to :back
  end
end