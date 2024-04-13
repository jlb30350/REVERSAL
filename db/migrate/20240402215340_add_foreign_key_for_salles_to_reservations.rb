class AddForeignKeyForSallesToReservations < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :reservations, :salles, column: :salle_id
  end
end
