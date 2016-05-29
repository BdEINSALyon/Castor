class Voter < ActiveRecord::Base
  has_secure_token
  after_create :send_email
  private
  def send_email
    VoterMailer.deliver_vote_email(self)
  end
end
