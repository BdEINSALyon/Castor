class VoteController < ApplicationController

  before_filter :is_open?, only: [:vote, :register_vote]
  before_filter :set_voter, only: [:vote, :register_vote]

  def vote
    @lists = Listing.all
    @vote = Vote.new
  end

  # noinspection RailsChecklist01
  def register_vote
    begin
      Vote.create! vote_params
    rescue
      # ignored
    end
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
    opening = Time.parse(ENV['OPENING'])
    closing = Time.parse(ENV['CLOSING'])
    redirect_to :closed unless now > opening && now < closing
  end

  private
  def set_voter
    @voter = Voter.find_by_token(params[:token])
    if @voter.nil?
      raise ActiveRecord::RecordNotFound
    end
    if @voter.voted
      redirect_to :thanks
    end
  end

  def vote_params
    params.fetch(:vote).permit(:listing_id)
  end
end
