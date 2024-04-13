class RemoveSalleIdFromReservations < ActiveRecord::Migration[7.1]
  def change
    remove_column :reservations, :salle_id, :integer
  end
end
