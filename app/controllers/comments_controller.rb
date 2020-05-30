class CommentsController < ApplicationController
  def create
    Comment.create(text: params[:text], post_id: params[:post_id], user_id: current_user.id)
  end

  private
  def comment_params
    params.permit(:text, :post_id)
  end
end
