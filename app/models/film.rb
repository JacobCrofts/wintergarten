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

  def self.top_five
    self.all.to_a.sort_by {|film| film.average_rating}.reverse[0..4]
  end

end
