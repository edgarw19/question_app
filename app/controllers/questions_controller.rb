class QuestionsController < ApplicationController
	before_filter :check_auth, :only => [:edit, :update, :destroy]
	def new
		@question = Question.new
	end

	def create
		@question = Question.new(params[:question])
		if @question.save
			redirect_to @question
		else
			render 'new'
		end
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		if @question.update_attributes(params[:question])
			redirect_to @question
		else
			render 'edit'
		end
	end

	def index
		@questions = Question.paginate(:page => params[:page])
	end

	def show
		@question = Question.find(params[:id])
		@answer = @question.answers.new(params[:answer])
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to questions_path
	end

	def like
		@question = Question.find(params[:id])
		@question.liked_by current_user
		redirect_to questions_path
	end

	def dislike
		@question = Question.find(params[:id])
		@question.downvote_from current_user
		redirect_to questions_path
	end
end

