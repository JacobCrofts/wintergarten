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

require 'rails_helper'

# RSpec.describe Review, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
