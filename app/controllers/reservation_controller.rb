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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
