class AddNameToSalles < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:salles, :name)
      add_column :salles, :name, :string
    end
  end
end
