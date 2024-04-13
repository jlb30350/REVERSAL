Rails.application.routes.draw do
  # Devise routes for authentication
  devise_for :users

  # Resources for "salles" with all CRUD operations
  resources :salles

  # Resources for reservations with custom actions
  resources :reservations do
    member do
      patch 'cancel' # Custom action for canceling a reservation
    end
    collection do
      delete 'destroy_multiple' # Custom action for deleting multiple reservations
    end
  end

  # Resources for users
  resources :users, only: [:destroy] do
    collection do
      delete 'destroy_multiple' # If you need a similar action for users
    end
  end

  # Custom route for deleting a user account
  delete 'users/:id', to: 'users#destroy', as: 'destroy_user'

  # Root path of the application
  root 'salles#index'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
