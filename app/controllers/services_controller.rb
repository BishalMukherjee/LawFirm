class ServicesController < ApplicationController
  before_action :require_login
  def index
    @services = Service.all
  end

  def new
    @service = Service.new
    @clients = Client.all
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to services_path
    else
      flash[:message] = @service.errors.full_messages
      redirect_to new_service_path
    end
  end

  def edit
    @service = Service.find(params[:id])
    @clients = Client.all
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to services_path
    else
      flash[:message] = @service.errors.full_messages
      redirect_to edit_admin_path(@service)
    end
  end

  def destroy
    @service = Service.find(params[:id])
  end

  private
  def service_params
    params.require(:service).permit(:name, :charge, :client_id, :start_date, :end_date)
  end
  
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access user section"
      redirect_to root_path
    end
  end
end