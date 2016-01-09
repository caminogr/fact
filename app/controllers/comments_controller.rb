class CommentsController < ApplicationController
  def create
    current_user.comments.create(comment_params)
    redirect_to event_path(params[:event_id])
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to event_path(params[:event_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(event_id: params[:event_id])
  end
end
