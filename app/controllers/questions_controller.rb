class QuestionsController < ApplicationController
  # REVIEW: you've already included these modules in the application controller, remove them from here.
  include ApplicationHelper
  include QuestionHelper
  before_filter :redirect_to_signup, :only => [:new]
  before_filter :authorize_user, :only => [:create, :edit, :update]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    if @question.save
      redirect_to root_path
    else
      # flash[:error] = @question.errors
      render :new
    end
  end

  def show
    @vote = Vote.new
    @question = Question.find params[:id]
  end

  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.find params[:id]
    @question.update_attributes(params[:question])
    redirect_to @question
  end

  private
  def authorize_user
    redirect_to @question, :notice => "Sorry, only the creator can edit a question" unless @question.owner?(current_user)
  end

end
