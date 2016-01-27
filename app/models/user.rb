# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :comments, foreign_key: :commenter_id
  has_many :reviews, foreign_key: :reviewer_id
  has_many :ratings, foreign_key: :rater_id

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password_digest, presence: true
  validates :email, uniqueness: true

  has_secure_password

  def trusted?
  	# user must have at least 50 RATED reviews
  	# average rating of 3.5 or higher for those reviews
  	user_reviews = reviews_with_ratings
		user_reviews.length > 49 && (avg_rating_for_user_reviews(user_reviews) >= 3.5) ? true : false
  end

	def reviews_with_ratings
		self.reviews.select{ |review| review.ratings.length > 0 }
  end

  def avg_rating_for_user_reviews(user_reviews)
  	# how many reviews have been rated?
  	# of those, what is the sum rating?
  	reviews_rating_sum = 0
  	user_reviews.each do |review|
  		if review.average_rating.is_a?(Numeric) && review.average_rating > 0
  			reviews_rating_sum += review.average_rating
  		end
  	end
  	reviews_rating_sum / user_reviews.length
  end

end
