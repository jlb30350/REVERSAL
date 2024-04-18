#controllers/reservation_controller.rb

class ReservationController < ApplicationController

  validates_presence_of :start_time, message: 'doit être renseigné.'
  validates_presence_of :end_time, message: 'doit être renseigné.'
 



  def index
  end

  def show
  end

  def new
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      # Envoi de l'e-mail de confirmation avec les détails de la réservation
      UserMailer.confirmation_email(@reservation).deliver_now
      redirect_to @reservation, notice: 'Réservation créée avec succès.'
    else
      render :new
    end
  end

  private

  # Méthode pour sécuriser les paramètres de la réservation
  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :reserver_name, :reserver_email, :salle_id)
  end
end







  end

  def edit
  end

  def update
  end

  def destroy
  end
end
