class QuestionsController < ApplicationController
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

	def index
		@questions = Question.paginate(:page => params[:page])
	end

	def show
		@question = Question.find(params[:id])
	end
end

