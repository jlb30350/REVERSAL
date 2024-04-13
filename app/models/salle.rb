# app/models/salle.rb
class Salle < ApplicationRecord
  validates :name, presence: true
  # autres validations...
  has_many :reservations,dependent: :destroy
  # Autres validations et méthodes...
end
