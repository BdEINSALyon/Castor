class VoterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.voter_mailer.vote_email.subject
  #
  # @param [Voter] voter
  def vote_email(voter)
    @voter = voter
    mail to: @voter, subject: (ENV['EMAIL_SUBJECT'] || 'Elections BdE INSA Lyon')
  end
end
