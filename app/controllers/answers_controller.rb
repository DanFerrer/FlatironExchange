class AnswersController < ApplicationController

	def create
		@answer = Answer.create(answer_params)
		binding.pry
		redirect_to questions_path(@answer.question.id)

		#I'm adding comment because commit won't work
	end

	def answer_params
   params.require(:answer).permit(:content, :question_id)
  end

end
