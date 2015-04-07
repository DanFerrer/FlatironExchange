class SearchController < ApplicationController
  def index
    # binding.pry
    @questions = Question.search(params[:search])
  end
end
