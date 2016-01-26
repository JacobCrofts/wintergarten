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
end
