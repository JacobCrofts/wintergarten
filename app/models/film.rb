class Film < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :reviews
  has_many :ratings, as: :rateable
end
