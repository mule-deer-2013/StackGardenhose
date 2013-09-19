class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    q = Question.new(params[:question])
    if q.save
      redirect_to root_path
    else
      flash[:error] = "There was a problem with your question"
      render :new
    end
  end

  def show
    @question = Question.find params[:id]
  end

end
