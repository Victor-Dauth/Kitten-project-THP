class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_exists?, :check_user, only: [:show]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "Bien joué ! Ton profil a été modifié 🎉"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "Oups ! On ne peut pas modifier ton profil pour les raisons suivantes :"
      render :edit
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end

  def user_exists?
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound  
      flash[:warning] = "Oups, on dirait que ce compte n'existe pas encore 😬"
      redirect_to root_path
    end
  end

  def check_user
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      flash[:warning] = "Bien essayé 😁"
      redirect_to root_path
    end
  end
end
