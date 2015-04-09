class SearchController < ApplicationController
  def index
    @questions = Question.search(params[:search])
    # Question.all.each do |question|
    #   if question.tags.empty?
    #   else

    #   end
    # end
    # search by tags if !Question.last.tags.empty?
  end
end