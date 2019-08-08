class GossipsController < ApplicationController

  def index
    @first_name = session[:username]
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find_by(id: params['id'])
  end

  def new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content])
    @gossip.user = User.find_by(first_name: 'Ano', last_name: 'Nymous')
    if @gossip.save
      redirect_to gossips_path
    else
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)
    redirect_to gossips_path
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end
end
