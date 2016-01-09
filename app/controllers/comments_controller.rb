class CommentsController < ApplicationController
  def create
    current_user.comments.create(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(event_id: params[:event_id])
  end
end
