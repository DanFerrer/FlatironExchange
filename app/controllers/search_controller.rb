class SearchController < ApplicationController
  def index
    @questions = Question.search(search_params)
    if @questions.size == 1
      redirect_to question_path(@questions.first.id)
    end
  end


  private
  def search_params
    params.require(:search)
  end
end
