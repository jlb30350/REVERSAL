class AddSalleIdToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :salle_id, :integer
    add_index :reservations, :salle_id
    add_reference :reservations, :salle, foreign_key: true
  end
end
