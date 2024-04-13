class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :reservations, dependent: :destroy

  # Automatically confirm user in development environment
  after_create :auto_confirm_in_development, if: -> { Rails.env.development? }

  private

  # Method to auto-confirm user
  def auto_confirm_in_development
    confirm # This calls the Devise confirm! method, skipping the confirmation e-mail
  end
end
