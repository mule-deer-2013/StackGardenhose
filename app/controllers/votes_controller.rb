class VotesController < ApplicationController

  def create
    vote = Vote.create(params[:vote])
    answer = vote.votable
    render :json => render_to_string(:partial => 'votes/counter', :locals => { answer: answer} ).to_json
  end

end


