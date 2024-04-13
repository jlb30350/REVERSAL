class CreateSalles < ActiveRecord::Migration[7.1]
  def change
    create_table :salles do |t|
      t.string :name

      t.timestamps
    end
  end
end
