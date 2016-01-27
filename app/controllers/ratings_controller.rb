require 'json'

class RatingsController < ApplicationController

  def create
    if request.xhr?
      data = params[:data]
      rateable_id = data["rateable_id"].to_i
      rateable_type = data["rateable_type"]
      value = data["value"].to_i
      rater_id = session[:user_id]
      @rating = Rating.new(rateable_id: rateable_id, rateable_type: rateable_type, value: value, rater_id: rater_id)
      if @rating.save
        render json: {value: value, review_id: @rating.rateable_id}
      end
    end
  end
end
