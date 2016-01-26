class Film < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :reviews
  has_many :ratings, as: :rateable


  def average_score
    self.ratings.reduce(0){|sum, rating| sum + rating.value } / self.ratings.length.to_f
  end


end
