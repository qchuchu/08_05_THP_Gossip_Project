class CommentsController < ApplicationController

  def create
    comment = params[:comment]
    user = User.find_by(first_name: 'Ano', last_name: 'Nymous')
    gossip = Gossip.find(comment[:id])
    @comment = Comment.create(content: comment[:content])
    user.comments << @comment
    gossip.comments << @comment
    redirect_to gossip_path(comment[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    comment_params = params.require(:comment).permit(:content)
    @comment.update(comment_params)
    redirect_to gossip_path(@comment.commentable_id)
  end
end
