# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer
#  commenter_id     :integer
#  content          :text
#  commentable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: "User"

  validates :commentable_id, presence: true
  validates :commenter_id, presence: true
  validates :content, presence: true
  validates :commentable_type, presence: true
end
