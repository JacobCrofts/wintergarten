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

end
