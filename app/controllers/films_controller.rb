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

class FilmsController < ApplicationController
	def index
		@films = Film.all
	end

	def show
		@film = Film.find(params[:id])
  end



end
