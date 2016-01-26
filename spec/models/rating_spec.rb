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

require 'rails_helper'

# RSpec.describe Rating, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
