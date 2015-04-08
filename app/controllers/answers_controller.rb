class AnswersController < ApplicationController

	def index
		question = Question.find(params[:question_id])
		@answers = question.answers
	end

	def create
		question = Question.find(params[:question_id])
		# binding.pry
    question.answers.create(answer_params)
		redirect_to question_path(question)
	end

	private
	def answer_params
    params.require(:answer).permit(:content).merge(responder_id: current_user.id)
	end
end
