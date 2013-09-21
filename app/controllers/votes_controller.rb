class VotesController < ApplicationController
  def create
    vote = Vote.create(params[:vote])
    votable = vote.votable
    render :json => render_to_string(:partial => 'votes/counter', :locals => { votable: votable} ).to_json
  end
end
