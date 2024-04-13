class AddReserverNameToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :reserver_name, :string
  end
end
