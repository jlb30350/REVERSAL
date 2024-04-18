
# app/controllers/contacts_controller.rb

class ContactsController < ApplicationController
  def send_email
    ContactMailer.contact_email(params[:nom], params[:email], params[:message]).deliver_now
    
    flash[:notice] = "Votre message a été envoyé avec succès. Nous vous répondrons bientôt!"
    redirect_back(fallback_location: root_path)
  rescue StandardError => e
    flash[:alert] = "Erreur lors de l'envoi du message : #{e.message}"
    redirect_back(fallback_location: root_path)
  end
end
