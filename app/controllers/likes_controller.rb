class LikesController < ApplicationController
  def create
    @comment = Comment.find(params[:comment_id])
    #comment_idの取得
    Like.find_or_create_by(comment_id: params[:comment_id], user_id: current_user.id)
    @like_comment_ids = current_user.likes.where(comment: @comment).pluck(:comment_id)
  end
end
