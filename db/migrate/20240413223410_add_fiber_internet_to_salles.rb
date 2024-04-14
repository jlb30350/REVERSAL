class AddFiberInternetToSalles < ActiveRecord::Migration[7.1]
  def change
    add_column :salles, :fiber_internet, :boolean
  end
end
