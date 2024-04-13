class AllowNullUserIdInReservations < ActiveRecord::Migration[7.0]
  def change
    change_column_null :reservations, :user_id, true
  end
end

