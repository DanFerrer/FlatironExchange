class AnswersController < ApplicationController

	def create
		@answer = Answer.create(answer_params)
		binding.pry
		redirect_to questions_path(@answer.question.id)
	end

	def answer_params
   params.require(:answer).permit(:content, :question_id)
  end

end
