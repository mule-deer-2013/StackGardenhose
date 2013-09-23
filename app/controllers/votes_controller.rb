class VotesController < ApplicationController
  def create
    votable = params[:votable_type].classify.constantize.find params[:votable_id]
    votable.votes.create params[:vote]
    render :json => render_to_string(:partial => 'votes/counter', :locals => { votable: votable} ).to_json
  end
end
