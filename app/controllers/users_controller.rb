class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params['id'])
  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :description,
      :age,
      :password,
      :password_confirmation,
      city_attributes: [:id, :city_name, :zip_code]
    )
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Vous êtes bien enregistré !"
      redirect_to gossips_path
    else
      render :new
    end
  end
end
