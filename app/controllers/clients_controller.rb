class ClientsController < ApplicationController
  before_action :require_login
  def index
    @clients = Client.all
  end
  
  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      flash[:message] = @client.errors.full_messages
      redirect_to new_client_path
    end
  end
  
  def show
    @client = Client.find(params[:id])
    @services = @client.services
  end

  def edit
    @client = Client.find(params[:id])
  end
  
  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to clients_path
    else
      flash[:message] = @client.errors.full_messages
      redirect_to edit_admin_path(@client)
    end
  end
  
  def destroy
    @client = Client.find(params[:id])
    if @client.services.exist?
      redirect_to clients_path, notice: "Client using services.Cant be deleted."
    else
      @client.destroy
      redirect_to clients_path
    end
  end

  private
  def client_params
    params.require(:client).permit(:name, :email)
  end
  
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access user section"
      redirect_to root_path
    end
  end
end