class SessionsController < ApplicationController
  # Page de Login
  def new

  end

  # Authentification
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to gossips_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  # Logout
  def destroy
    session.delete(:user_id)
  end
end
