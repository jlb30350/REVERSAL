class SetupReservations < ActiveRecord::Migration[7.1]
  def change
    # Assurez-vous que cette colonne n'est pas déjà ajoutée par une migration précédente
    unless column_exists?(:reservations, :salle_id)
      add_reference :reservations, :salle, foreign_key: true
    end
  end
end
