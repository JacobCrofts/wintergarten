# == Schema Information
#
# Table name: ratings
#
#  id            :integer          not null, primary key
#  rateable_id   :integer
#  rater_id      :integer
#  rateable_type :string
#  value         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Rating < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
  belongs_to :rater, class_name: "User"

  validates :rateable_id, presence: true
  validates :rater_id, presence: true
  validates :rateable_type, presence: true
  validates :value, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 4}
end
