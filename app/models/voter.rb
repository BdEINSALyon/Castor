class Voter < ActiveRecord::Base
  has_secure_token
  after_create :send_email

  rails_admin do
    import do
      include_all_fields
      exclude_fields :token, :voted
    end
  end

  private
  def send_email
    VoterMailer.vote_email(self).deliver
  end
end
