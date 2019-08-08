class CommentsController < ApplicationController

  def create
    comment = params[:comment]
    user = current_user
    gossip = Gossip.find(comment[:id])
    @comment = Comment.create(content: comment[:content])
    user.comments << @comment
    gossip.comments << @comment
    redirect_to gossip_path(comment[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
    if current_user != @comment.user
      flash[:access_denied] = 'You are not allowed to edit this comment'
      redirect_back fallback_location: gossip_path(@comment.commentable_id)
    end
  end

  def update
    @comment = Comment.find(params[:id])
    comment_params = params.require(:comment).permit(:content)
    @comment.update(comment_params)
    redirect_to gossip_path(@comment.commentable_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    gossip_id = Gossip.find(@comment.commentable_id).id
    @comment.destroy
    redirect_to gossip_path(gossip_id)
  end
end
