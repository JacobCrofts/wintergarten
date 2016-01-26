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

  def average_rating
    if self.ratings.length > 0
      self.ratings.reduce(0){|sum, rating| sum + rating.value } / self.ratings.length.to_f
    else
      "unrated"
    end
  end

end
