class CommentsController < ApplicationController
	def create
		@answer = Answer.find(params[:answer_id])
		@comment = @answer.comments.new(params[:comment])
		@comment.writer = current_user.username
		@comment.save
			redirect_to question_path(@answer)
	end
end
