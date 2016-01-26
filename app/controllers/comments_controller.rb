class CommentsController < ApplicationController

  def new
    @comment = Comment.new(comment_params)

    puts @comment
    puts comment_params
    puts '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'

  end

  def comment_parms
    params.require(:comment).permit(:content, :commentable_id, :commentable_type, :commenter_id                                           )
  end



end
