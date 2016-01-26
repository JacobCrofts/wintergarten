class CommentsController < ApplicationController

  def new
    @comment = Comment.new(comment_params)
  end

  def comment_parms
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end



end
