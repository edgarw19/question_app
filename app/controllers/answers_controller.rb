class AnswersController < ApplicationController
	before_filter :get_question
	before_filter :check_auth, :only => [:show, :index, :edit, :update, :destroy]
	def check_auth
		if !user_signed_in?
			redirect_to new_user_session_path
		end
	end
	def get_question
		@question = Question.find(params[:question_id])
	end

	def index
		@answers = @question.answers
	end

	def show
		@answer = Answer.find(params[:id])
		@comment = @answer.comments.new(params[:comment])
	end

	def create
		@answer = @question.answers.new(params[:answer])
		if @answer.anonymous == true
			@answer.commenter = "Anonymous"
		else
			@answer.commenter = current_user.username
		end
		@answer.save
		if @answer.save
			redirect_to question_path(@question)
		else
			redirect_to questions_path
		end
	end

	def like
		@answer = Answer.find(params[:id])
		@answer.liked_by current_user
		redirect_to question_path(@question)

	end

	def dislike
		@answer = Answer.find(params[:id])
		@answer.downvote_from current_user
		redirect_to question_path(@question)

	end

end
