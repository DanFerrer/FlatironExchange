class AnswersController < ApplicationController

	def index
		question = Question.find(params[:question_id])
		@answers = question.answers
	end

	def create
		question = Question.find(params[:question_id])
    question.answers.create(answer_params)
		flash[:success] = "Your answer has been submitted!"
		redirect_to question_path(question)
	end

	def vote_up
		answer = Answer.find(params[:id])
		if current_user.voted_for?(answer)
			flash[:danger] = "You've aready voted on this question"
			redirect_to question_path(answer.question)
		else
			current_user.vote_for(answer)
			flash[:success] = "Thanks for voting!"
			redirect_to question_path(answer.question)
		end
	end

	private
	def answer_params
    params.require(:answer).permit(:content).merge(responder_id: current_user.id)
	end
end
