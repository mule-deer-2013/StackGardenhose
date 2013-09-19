class AnswersController < ApplicationController

  def new
  end

  def create
    @answer = Answer.new(params[:answer])
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      flash[:error] = @answer.errors
      redirect_to question_path(@answer.question)
    end
  end

end
