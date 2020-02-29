class LikesController < ApplicationController
  def create
    current_user.likes.create!(comment_id: params[:comment_id])
    redirect_to comments_path
  end
end
