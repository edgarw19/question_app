class AnswersController < ApplicationController
<<<<<<< HEAD
=======
	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.create(params[:answer])
			redirect_to question_path(@question)
	end

>>>>>>> testing
end
