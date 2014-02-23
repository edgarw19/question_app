class AnswersController < ApplicationController
	before_filter :get_question
	def get_question
		@question = Question.find(params[:question_id])
	end

	def index
		@answers = @question.answers
	end

	def show
		@question = Question.find(params[:question_id])
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

end
