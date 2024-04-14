# app/models/salle.rb



class Salle < ApplicationRecord
  # Associations
  has_many :reservations, dependent: :destroy

  # Validations de base
  validates :name, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :description, presence: true, length: { maximum: 500 }


  # Validations pour les nouveaux champs booléens avec gestion de valeurs par défaut
  validates :air_conditioning, :sound_system, :water_fountain, :projector,
            inclusion: { in: [true, false], message: "%{value} is not a valid boolean" },
            allow_nil: true

  # Validations pour les champs numériques et textuels supplémentaires
  validates :wifi_code, length: { maximum: 50 }, allow_blank: true
  validates :area, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :table_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  # Callback pour définir les valeurs par défaut après l'initialisation
  after_initialize :set_defaults, unless: :persisted?

  private

  def set_defaults
    # Définition des valeurs par défaut pour les champs booléens
    self.air_conditioning ||= false
    self.sound_system ||= false
    self.water_fountain ||= false
    self.projector ||= false
  end
end
