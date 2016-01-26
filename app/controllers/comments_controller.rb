class CommentsController < ApplicationController


  def create
    # user
    user = User.find_by(id: session[:user_id])
    # commentable
    if params[:film_id]
      commentable = Film.find(params[:film_id])
    else
      commentable = Review.find(params[:review_id])
    end

    @comment = commentable.comments.build(comment_params.merge(commenter: user))
    if @comment.save
      redirect_to commentable
    else
      render commentable
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end



end
