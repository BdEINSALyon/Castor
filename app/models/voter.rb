class Voter < ActiveRecord::Base
  has_secure_token
  after_create :send_email
  scope :not_voted, -> {where(:voted => nil)}

  rails_admin do
    import do
      include_all_fields
      exclude_fields :token, :voted
    end
  end

  # Resend link to user
  def send_link
    VoterMailer.link_email(self).deliver
  end
  # Resend link to user
  def remind
    VoterMailer.reminder_email(self).deliver_later
  end
  private
  def send_email
    VoterMailer.vote_email(self).deliver
  end
end
