class AddSalleIdBackToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :salle_id, :integer
    add_index :reservations, :salle_id
  end
end
