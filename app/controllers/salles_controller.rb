

# app/controllers/salles_controller.rb
class SallesController < ApplicationController

  def index
    @salles = Salle.all
    @reservations = Reservation.all
  end



  def show
    @salle = Salle.find(params[:id])

  end

  def new
    @salle = Salle.new
  end

  def create
    @salle = Salle.new(salle_params)
    if @salle.save
      redirect_to @salle, notice: 'Salle créée avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @salle = Salle.find(params[:id])
  end

  def destroy
    @salle = Salle.find(params[:id])
    @salle.destroy
    redirect_to salles_path, notice: "La salle a été supprimée avec succès."
  end


  def update
    @salle = Salle.find(params[:id])
    if @salle.update(salle_params)
      redirect_to salle_path(@salle), notice: "La salle a été mise à jour avec succès."
    else
      render :edit
    end
  end

  private

  def salle_params
    params.require(:salle).permit(:name, :capacity, :description, :air_conditioning, :sound_system, :water_fountain, :projector, :wifi_code, :area, :table_count)
  end
end
