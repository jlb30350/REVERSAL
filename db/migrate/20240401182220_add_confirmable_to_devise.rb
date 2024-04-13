class AddConfirmableToDevise < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :confirmation_token, :string
    add_index  :users, :confirmation_token, unique: true
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    # Décommentez ci-dessous si votre modèle Devise utilise `reconfirmable` :
    # add_column :users, :unconfirmed_email, :string # Seulement si vous utilisez reconfirmable
  end
end
