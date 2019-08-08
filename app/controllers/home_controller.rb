class HomeController < ApplicationController
  skip_before_action :authenticate_user

  def show
    redirect_to gossips_path if logged_in?
  end
end
