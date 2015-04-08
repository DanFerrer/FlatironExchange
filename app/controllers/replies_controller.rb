class RepliesController < ApplicationController

	def create
		@reply = Reply.create(reply_params)
		redirect_to question_path(@reply.question)
	end

	def reply_params
		params.require(:reply).permit(:content, :answer_id)
	end
end