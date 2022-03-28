class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name('vrandaagrawal410@gmail.com','Vranda Agrawal')
  layout "mailer"
end
