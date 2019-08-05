class WelcomeController < ApplicationController
  def show
    @first_name = params['first_name']
    @gossips = Gossip.all
  end
end
