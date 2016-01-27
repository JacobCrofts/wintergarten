# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  film_id     :integer
#  reviewer_id :integer
#  title       :string
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :ratings, as: :rateable
  belongs_to :film
  belongs_to :reviewer, class_name: "User"

  validates :film_id, presence: true
  validates :reviewer_id, presence: true
  validates :title, presence: true
  validates :content, presence: true


  def average_rating
    ratings = get_valid_ratings
    if ratings.length > 0
      ratings.reduce(0){|sum, rating| sum + rating.value } / ratings.length.to_f
    end
  end

  ###
  # Get those ratings that are integers. Disregard nil ratings
  ###
  def get_valid_ratings
    self.ratings.select{ |rating| rating.value.is_a? Numeric }
  end

  def rounded_stars
    (self.average_rating * 2).to_i / 2.0
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
    rating = user.ratings.where(rateable_id: self.id, rateable_type: "Review")
    rating.first.value
  end

end
