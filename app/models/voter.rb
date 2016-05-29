class Voter < ActiveRecord::Base
  has_secure_token
  after_create :send_email

  def name
    "#{first_name} #{last_name.upcase}"
  end

  private
  def send_email
    VoterMailer.vote_email(self).deliver
  end
end
