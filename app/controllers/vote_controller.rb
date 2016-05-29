class VoteController < ApplicationController

  before_filter :set_voter, only: [:vote, :register_vote]

  def vote
    @lists = Listing.all
    @vote = Vote.new
  end

  # noinspection RailsChecklist01
  def register_vote
    Vote.create! vote_params
    @voter.update! voted: true
    redirect_to :thanks
  end

  def thanks
  end

  private
  def set_voter
    @voter = Voter.find_by_token(params[:token])
    if @voter.nil?
      render :status => :forbidden, :text => 'Invalid token'
    end
    if @voter.voted
      redirect_to :thanks
    end
  end

  def vote_params
    params.require(:vote).permit(:listing_id)
  end
end
