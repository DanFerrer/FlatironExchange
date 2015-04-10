class SearchController < ApplicationController
  def index
    @questions = Question.search(params[:search])
    if @questions.size == 1
      redirect_to question_path(@questions.first.id)
    end
  end
end