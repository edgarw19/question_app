class CommentsController < ApplicationController
	def create
		@answer = Answer.find(params[:answer_id])
		@comment = Comment.create(params[:comment], answer: answer)
			redirect_to question_path(@question)
	end
end
