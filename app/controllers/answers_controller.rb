class AnswersController < ApplicationController
  def new
  end

  def create
    answer = Answer.create(params[:answer])
    redirect_to question_path(answer.question)
  end
end
