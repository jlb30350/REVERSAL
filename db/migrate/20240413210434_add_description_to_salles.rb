class AddDescriptionToSalles < ActiveRecord::Migration[7.1]
  def change
    add_column :salles, :description, :text
  end
end
