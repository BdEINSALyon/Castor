# Preview all emails at http://localhost:3000/rails/mailers/voter_mailer
class VoterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/voter_mailer/vote_email
  def vote_email
    VoterMailer.vote_email
  end

end
