class VoterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.voter_mailer.vote_email.subject
  #
  # @param [Voter] voter
  def vote_email(voter)
    @voter = voter
    mail to: @voter.email, subject: (ENV['EMAIL_SUBJECT'] || 'Elections BdE INSA Lyon') unless voter.nil?
  end

  def link_email(voter)
    @voter = voter
    mail to: @voter.email, subject: (ENV['EMAIL_SUBJECT'] || 'Elections BdE INSA Lyon') unless voter.nil?
  end

  def reminder_email(voter)
    @voter = voter
    mail to: @voter['email'], subject: (ENV['EMAIL_SUBJECT'] || 'Elections BdE INSA Lyon') unless voter.nil?
  end

  def thanks_email(voter)
    @voter = voter
    mail to: @voter['email'], subject: (ENV['EMAIL_SUBJECT'] || 'Elections BdE INSA Lyon') unless voter.nil?
  end
end
