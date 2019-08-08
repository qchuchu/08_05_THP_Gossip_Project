class LikesController < ApplicationController
  def show
  end

  def create
    like = Like.new(user: current_user)
    if params[:comment_id].nil?
      gossip = Gossip.find(params[:gossip_id])
      gossip.likes << like
    else
      comment = Comment.find(params[:comment_id])
      comment.likes << like
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    Like.delete(params[:id])
    redirect_back fallback_location: root_path
  end
end
