class AddReserverEmailToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :reserver_email, :string
  end
end
