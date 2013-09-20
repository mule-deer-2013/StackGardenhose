class AnswersController < ApplicationController

  def new
  end

  def create
    @answer = Answer.new(params[:answer])
    @answer.user_id = session[:current_user_id]
    @answer.save

    if @answer.save
      redirect_to question_path(@answer.question)
    else
      flash[:error] = @answer.errors
      redirect_to question_path(@answer.question)
    end
  end
  def edit

  end

  def update
    
  end

end
