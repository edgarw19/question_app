class CommentsController < ApplicationController
	before_filter :get_question
	before_filter :check_auth, :only => [:show, :index, :edit, :update, :destroy]
	def check_auth
		if !user_signed_in?
			redirect_to welcome_path
		end
	end
	def get_question
		@question = Question.find(params[:question_id])
	end
	def create
		@answer = Answer.find(params[:answer_id])
		@comment = @answer.comments.new(params[:comment])
		@comment.writer = current_user.username
		@comment.save
		redirect_to question_answer_path(@question, @answer)
	end

	def like
		@answer = Answer.find(params[:answer_id])
		@comment = Comment.find(params[:id])
		@comment.liked_by current_user
		redirect_to question_answer_path(@question, @answer)

	end

	def dislike
		@answer = Answer.find(params[:answer_id])
		@comment = Comment.find(params[:id])
		@comment.downvote_from current_user
		redirect_to question_answer_path(@question, @answer)
	end
end
