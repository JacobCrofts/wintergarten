require 'json'

class RatingsController < ApplicationController

  def create
    if request.xhr?
      film_data = params[:film_data]
      rateable_id = film_data["rateable_id"].to_i
      rateable_type = film_data["rateable_type"]
      value = film_data["value"].to_i
      rater_id = session[:user_id]
      @rating = Rating.new(rateable_id: rateable_id, rateable_type: rateable_type, value: value, rater_id: rater_id)
      if @rating.save
        render json: {value: value}
      end
    end
  end

end

# {"rateable_id"=>"1", "rateable_type"=>"Film", "value"=>"4", "rater_id"=>"1"}