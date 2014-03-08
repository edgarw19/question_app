class QuestionsController < ApplicationController
	before_filter :check_auth, :only => [:show, :index, :edit, :update, :destroy]
	def check_auth
		if !user_signed_in?
			redirect_to welcome_path
		end
	end
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
		@questions = Question.order("cached_votes_up").paginate(:page => params[:page])
	end

	def show
		@question = Question.find(params[:id])
		@answer = Answer.new(params[:answer]).tap { |a| a.question = @question }
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

