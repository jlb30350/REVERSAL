class SessionsController < Devise::SessionsController
  def destroy
    super
    flash[:notice] = "Vous avez été déconnecté avec succès."
  end
end
