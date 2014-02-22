class CommentsController < ApplicationController
	def create
		@question = Question.find(params[:question_id])
		@answer = Answer.find(params[:answer_id])
		@comment = @answer.comments.new(params[:comment])
		@comment.writer = current_user.username
		@comment.save
			redirect_to question_answer_path(@question, @answer)
	end
end
