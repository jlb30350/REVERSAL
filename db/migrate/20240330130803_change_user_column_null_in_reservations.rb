class ChangeUserColumnNullInReservations < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:reservations, :user_id, true, nil)
  end
end
