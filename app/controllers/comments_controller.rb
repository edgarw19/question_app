class CommentsController < ApplicationController
	def create
		@answer = Answer.find(params[:answer_id])
		@comment = @answer.comments.create(params[:comment])
			redirect_to question_path(@question)
	end
end
