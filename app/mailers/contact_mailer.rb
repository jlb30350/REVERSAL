# app/mailers/contact_mailer.rb
class ContactMailer < ApplicationMailer
    default from: 'no-reply@yourdomain.com'
  
    def contact_email(name, email, message)
      @name = name
      @message = message
      mail(to: 'jlbpau64@gmail.com', subject: 'Nouveau message du formulaire de contact', from: email)
    end
  end
  