class ApplicationController < ActionController::Base
  before_action :set_current_user

  private

   def set_current_user
     session[:username] = 'Visiteur' if session[:username].nil?
   end
end
