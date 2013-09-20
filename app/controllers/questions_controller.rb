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
    @vote = Vote.new
    @question = Question.find params[:id]
  end

  def edit
    @question = Question.find params[:id]
    if current_user != @question.user
      flash[:message] = "Sorry, only the creator can edit a question"
      redirect_to @question
    else
      render :edit
    end
  end

  def update
    @question = Question.find params[:id]
    @question.update_attributes(params[:question])
    redirect_to @question
  end

end
