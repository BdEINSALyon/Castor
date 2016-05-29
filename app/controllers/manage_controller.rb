class ManageController < ApplicationController

  # noinspection RailsParamDefResolve
  before_filter :authenticate_admin!

  def index
  end

  def register_voter
    @voter = Voter.new voter_params
    @success = @voter.save
  end

  def results
  end

  private
  def voter_params
    params.require(:voter).permit(:first_name, :last_name, :email)
  end
end
