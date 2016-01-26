class HomeController < ApplicationController
  def index
    @top_films = Film.top_five
  end
end