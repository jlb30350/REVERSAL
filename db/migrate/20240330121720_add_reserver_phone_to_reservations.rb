class AddReserverPhoneToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :reserver_phone, :string
  end
end
