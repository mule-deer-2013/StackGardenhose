class VotesController < ApplicationController

  def create
    vote = Vote.create(params[:vote])
    redirect_to vote.votable.question 
  end

end
