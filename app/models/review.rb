class Review < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :ratings, as: :rateable
  belongs_to :film
  belongs_to :reviewer, class_name: "User"
end
