class HomeController < ApplicationController
  def show
  end

  def create
    session[:username] = params['username']
    redirect_to gossips_path
  end
end
