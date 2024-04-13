class AddConfirmationToUsers < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:users, :confirmation_token)
      add_column :users, :confirmation_token, :string
      # Assurez-vous que cette ligne est exécutée avant de créer l'index
    end

    unless index_exists?(:users, :confirmation_token)
      add_index :users, :confirmation_token, unique: true
    end

    unless column_exists?(:users, :confirmed_at)
      add_column :users, :confirmed_at, :datetime
    end
  end
end
