
class CommentsController < ApplicationController

  def create
    user = User.find_by(id: session[:user_id])
    film = Film.find(params[:film_id])

    if params[:review_id]
      review = Review.find(params[:review_id])
      @comment = review.comments.build(comment_params.merge(commenter: user))
    else
      @comment = film.comments.build(comment_params.merge(commenter: user))
    end

    if @comment.save
      redirect_to film_path(film)
    else
      @film = film
      render "films/show"
    end
  end


  def edit
    user = User.find_by(id: session[:user_id])
    @comment = user.comments.find(params[:id])
  end


  def update
    user = User.find_by(id: session[:user_id])
    @comment = user.comments.find(params[:id])
    film = Film.find(params[:film_id])

    if @comment.commenter_id == user
      @comment.update(comment_params)
      redirect_to film_path(film)
    else
      render 'comments/edit_film'
    end
  end



  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to film_path(film)
  end


  def comment_params
    params.require(:comment).permit(:content)
  end

end
