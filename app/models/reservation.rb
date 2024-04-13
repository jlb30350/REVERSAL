# app/models/reservation.rb
class Reservation < ApplicationRecord
  belongs_to :salle
  belongs_to :user
  validate :end_time_after_start_time

  # Validations de présence pour les champs requis
  validates :lieu, :salle_id, :start_time, :end_time, :reserver_name, :reserver_phone, :reserver_email, presence: true

  # Validation du format de l'e-mail.
  validates :reserver_email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Validation du format du téléphone.
  validates :reserver_phone, format: { with: /\A[\d \(\)-]+\z/, message: "format non valide" }

  # Validation personnalisée pour s'assurer que la salle est disponible
  validate :salle_disponible?

  # Validation personnalisée pour s'assurer que l'heure de fin est postérieure à l'heure de début
  validate :end_time_after_start_time

  # Validation pour s'assurer que la réservation n'est pas pour un moment passé
  validate :start_time_cannot_be_in_the_past, :end_time_cannot_be_in_the_past

  def salle_disponible?
    existing_reservation = Reservation.where(salle_id: salle_id)
                                      .where.not(id: id)
                                      .where("start_time < ? AND end_time > ?", end_time, start_time)
                                      .exists?
    errors.add(:base, "La salle est déjà réservée pour ce créneau horaire.") if existing_reservation
  end

  def end_time_after_start_time
    errors.add(:end_time, "doit être postérieure à l'heure de début.") if end_time <= start_time
  end

  def start_time_cannot_be_in_the_past
    errors.add(:start_time, "ne peut pas être dans le passé.") if start_time.present? && start_time < Time.current
  end

  def end_time_cannot_be_in_the_past
    errors.add(:end_time, "ne peut pas être dans le passé.") if end_time.present? && end_time < Time.current
  end

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time <= start_time
      errors.add(:end_time, "doit être postérieure à l'heure de début.")
    end
  end

end
