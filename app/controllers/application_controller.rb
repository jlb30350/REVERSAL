#controllers/application_controller.rb

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
  end

  def after_sign_in_path_for(resource)
    new_reservation_path  # Ceci redirigera vers le formulaire de nouvelle réservation
  end
  


  # Autres configurations...
end
