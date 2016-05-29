class Voter < ActiveRecord::Base
  has_secure_token
  after_create :send_email

  def name
    first_name if last_name.nil? and not first_name.nil?
    last_name if first_name.nil? and not last_name.nil?
    'No Name' if first_name.nil? and last_name.nil?
    "#{first_name} #{last_name.upcase}"
  end

  private
  def send_email
    VoterMailer.vote_email(self).deliver
  end
end
