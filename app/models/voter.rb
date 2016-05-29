class Voter < ActiveRecord::Base
  has_secure_token
  after_create :send_email

  private
  def send_email
    VoterMailer.vote_email(self).deliver
  end
end
