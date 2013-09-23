module VotesHelper
  def upvote_form vote
    vote_form 1
  end

  def downvote_form vote
    vote_form -1
  end

  def vote_form value
    # write your erb
  end
end
