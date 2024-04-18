# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
  
    def confirmation_email(reservation)
      @reservation = reservation
      mail(to: @reservation.reserver_email, subject: 'Confirmation de réservation')
    end
  end
  