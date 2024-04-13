class AddLieuToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :lieu, :string
  end
end
