class AnswersController < ApplicationController
	before_filter :get_question
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
		@user = current_user
		@answer = @question.answers.new(params[:answer])
		@answer.commenter = @user.email
		if @answer.save
			redirect_to question_path(@question)
		else
			redirect_to questions_path
		end
	end

end
