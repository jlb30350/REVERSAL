class AddDetailsToSalles < ActiveRecord::Migration[7.1]
  def change
    add_column :salles, :capacity, :integer
    add_column :salles, :air_conditioning, :boolean
    add_column :salles, :sound_system, :boolean
    add_column :salles, :water_fountain, :boolean
    add_column :salles, :projector, :boolean
    add_column :salles, :wifi_code, :string
    add_column :salles, :area, :integer
    add_column :salles, :table_count, :integer
  end
end
