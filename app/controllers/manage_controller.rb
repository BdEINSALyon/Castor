class ManageController < ApplicationController

  # noinspection RailsParamDefResolve
  before_filter :authenticate_admin!

  def index
  end

  def register_voter
    @voter = Voter.new voter_params
    @success = @voter.save
  end

  # noinspection RailsChecklist01
  def results
    @participation = (((Voter.where(voted: true).count.to_d)/(Voter.count.to_d)) * 100.0).to_d.round 2
    @results = {}
    @results['Votes Blancs'] = Voter.where(voted: true).count - Vote.count
    Listing.all.each do |list|
      @results[list.name] = list.votes.count
    end
  end

  private
  def voter_params
    params.require(:voter).permit(:first_name, :last_name, :email)
  end
end
