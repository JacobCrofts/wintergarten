# == Schema Information
#
# Table name: films
#
#  id          :integer          not null, primary key
#  title       :string
#  runtime     :string
#  genre       :string
#  year        :integer
#  director    :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Film < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :reviews
  has_many :ratings, as: :rateable

  def average_rating
    if self.ratings.length > 0
      self.ratings.reduce(0){|sum, rating| sum + rating.value } / self.ratings.length.to_f
    else
      "unrated"
    end
  end

  def rounded_stars
    stars = (self.average_rating * 2).to_i / 2.0
    case stars
    when 1.0
    when 1.5
    when 2.0
    when 2.5
    when 3.0
    when 3.5
    when 4.0
    end
  end

  def self.top_five
    self.all.to_a.sort_by {|film| film.average_rating}.reverse[0..4]
  end

  def already_rated(user_id)
    user = User.find(user_id)
    rating_users = []
    self.ratings.to_a.each do |rating|
      rating_users << rating.rater
    end
    rating_users.include?(user)
  end

  def current_user_rating(user_id)
    user = User.find(user_id)
    rating = user.ratings.where(rateable_id: self.id, rateable_type: "Film")
    rating.first.value
  end

end
