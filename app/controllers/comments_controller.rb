class CommentsController < ApplicationController
  protect_from_forgery except: [:create, :destroy]
  before_action :authenticate_user!

  def create
    @message = Message.find(params[:comment][:message_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @message
    else
      flash[:alert] = "Comment should not be empty or too long (up to 140 characters)."
      redirect_to message_url(@message, comment_content: params[:comment][:content])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: message_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :message_id, :comment)
  end
end
