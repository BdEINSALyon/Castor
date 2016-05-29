class ApplicationMailer < ActionMailer::Base
  default from: ENV['EMAIL_SENDER'] || 'robot@elections.bde-insa-lyon.fr'
  layout 'mailer'
end
