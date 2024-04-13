class AddSalleIdColumnToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :salle_id, :integer unless column_exists?(:reservations, :salle_id)
    add_index :reservations, :salle_id unless index_exists?(:reservations, :salle_id)
  end
end