class BillingsController < ApplicationController
  before_action :require_login
  def index
    @billings = Billing.all
  end
  
  private
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access user section"
      redirect_to root_path
    end
  end
end