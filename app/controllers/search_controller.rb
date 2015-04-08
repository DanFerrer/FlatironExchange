class SearchController < ApplicationController
  def index
    @questions = Question.search(params[:search])
  end
end
