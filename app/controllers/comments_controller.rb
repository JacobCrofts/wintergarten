class CommentsController < ApplicationController

  def create
    # user
    user = User.find_by(id: session[:user_id])
    # commentable
      puts "************************************************************"

    film = Film.find(params[:film_id])
    if params[:review_id]
      review = Review.find(params[:review_id])
      @comment = review.comments.build(comment_params.merge(commenter: user))
      puts "************************************************************"
      puts @comment
    else
      @comment = film.comments.build(comment_params.merge(commenter: user))
      puts "************************************************************"
      puts @comment
    end

    if @comment.save
      puts "************************************************************"
      puts @comment
      redirect_to film_path(film)
    else
      @film = film
      render "films/show"
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
