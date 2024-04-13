class ReservationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/:id
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

 


  # POST /reservations
  def create
    @reservation = current_user.reservations.build(reservation_params)
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Réservation créée avec succès.' }
        format.js { render layout: false, content_type: 'text/javascript' }
      else
        if Salle.none?
          format.html { redirect_to new_salle_path, alert: "Aucune salle disponible. Veuillez d'abord créer une salle." }
          format.js { head :no_content } # Adjust as needed for your JS response
        else
          format.html { render :new, status: :unprocessable_entity }
          format.js { render :new, status: :unprocessable_entity }
        end
      end
    end
  end

  # GET /reservations/:id/edit
  def edit
  end

  # PATCH/PUT /reservations/:id
  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: 'La réservation a été mise à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Action pour supprimer plusieurs réservations
  def destroy_multiple
    Reservation.where(id: params[:reservation_ids]).destroy_all
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Les réservations sélectionnées ont été supprimées.' }
      format.json { head :no_content }
    end
  end




  # DELETE /reservations/:id
  def destroy
    @reservation.destroy
    redirect_to reservations_url, notice: 'La réservation a été supprimée avec succès.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:lieu, :salle_id, :start_time, :end_time, :reserver_name, :reserver_phone, :reserver_email)
  end
end
