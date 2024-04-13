class AdjustReservationsAndAddForeignKey < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:reservations, :salle_id)
      add_reference :reservations, :salle, index: true
    end
    unless foreign_key_exists?(:reservations, :salles)
      add_foreign_key :reservations, :salles, column: :salle_id
    end
  end
end
