class AnswersController < ApplicationController
	before_action :set_answer, only: [:show, :edit, :update, :destroy]
	before_action :change_answer, only: [:edit, :update, :destroy]

	def index
		question = Question.find(params[:question_id])
		@answers = question.answers
	end
	def edit
	end

	def create
		question = Question.find(params[:question_id])
    answer = question.answers.create(answer_params)
		flash[:success] = "Your answer has been submitted!"
		track_activity(answer)
		redirect_to question_path(question)
	end

	def update
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
	def set_answer
		@answer = Answer.find(params[:id])
	end

	def change_answer
		if Answer.find(params[:id]).responder != current_user
			flash[:danger] = "Sorry, you cant #{params[:action]} this answer. Click this message to close it"
			redirect_to root_url
		end
	end

	def answer_params
    params.require(:answer).permit(:content).merge(responder_id: current_user.id)
	end
end
