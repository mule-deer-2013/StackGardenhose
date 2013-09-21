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
    @answer = Answer.find(params[:id])
    @question = @answer.question
    if current_user.id == @answer.user_id
      render :edit
    else
      flash[:message] = "Must be author of answer to edit"
      redirect_to question_path(@question, @answer)
    end

  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update_attributes(params[:answer])
    redirect_to question_path(@answer.question)
  end

end
