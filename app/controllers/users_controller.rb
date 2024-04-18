class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      # Envoyer un e-mail de bienvenue à l'utilisateur
      UserMailer.welcome_email(@user).deliver_now

      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "Utilisateur supprimé avec succès."
  end

  private

  def user_params
    params.require(:user).permit(:email, :name) # Assurez-vous que les paramètres sont correctement configurés pour votre modèle User
  end
end
