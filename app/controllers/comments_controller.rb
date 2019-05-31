class CommentsController < ApplicationController
  def new
    
  end
  def create
    @comment = Comment.create(comment_params)
  end
  private
  def comment_params
    params.permit(:comment, :article_id).merge(user_id: current_user.id)
  end
end
