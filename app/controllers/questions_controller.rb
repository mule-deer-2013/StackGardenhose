class QuestionsController < ApplicationController
  include ApplicationHelper
  
  def index
    @questions = Question.all
  end

  def new
    redirect_to_signup
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    if @question.save
      redirect_to root_path
    else
      flash[:error] = @question.errors
      render :new
    end
  end

  def show
    @question = Question.find params[:id]
  end

end
