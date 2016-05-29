class VoteController < ApplicationController

  before_filter :is_open?, only: [:vote, :register_vote]
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

  def closed
  end

  private
  def is_open?
    now = Time.now
    opening = Time.new(2016, 5, 30, 0, 0, 0, '+02:00')
    closing = Time.new(2016, 6, 5, 23, 59, 59, '+02:00')
    redirect_to :closed unless now > opening && now < closing
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
