class ApplicationMailer < ActionMailer::Base
  default from: ENV['EMAIL_SENDER'] || 'BdE INSA Lyon <robot@elections.bde-insa-lyon.fr>'
  layout 'mailer'
end
