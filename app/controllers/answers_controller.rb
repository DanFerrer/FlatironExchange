class AnswersController < ApplicationController

	def create
		@answer = Answer.create(answer_params)
		redirect_to question_path(@answer.question)
	end

	def answer_params
   params.require(:answer).permit(:content, :question_id)
  end

end
