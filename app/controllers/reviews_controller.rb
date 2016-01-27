class ReviewsController < ApplicationController
	def create
		@film = Film.find(params[:film_id])
		@review = @film.reviews.create(review_params)
		@review.update_attributes(reviewer_id: session[:user_id])
		redirect_to film_path(@film)
	end


	private
		def review_params
			params.require(:review).permit(:reviewer_id, :title, :content)
		end
end
