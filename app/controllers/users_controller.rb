class UsersController < ApplicationController
  before_action :require_login 

  def index
    @users = User.all
  end
  
  def new
    if current_user
      @user = User.new
    else
      redirect_to root_path
    end
  end
  
  def create
    @user = User.new(user_params)
  
    if @user.save
      redirect_to users_path
    else
      flash[:message] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end
  
  def edit
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to users_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      flash[:message] = @user.errors.full_messages
      redirect_to edit_admin_path(@user)
    end
  end
  
  def destroy
    if current_user && current_user.admin_access
      @user = User.find(params[:id])
  
      unless current_user == @user
        @user.destroy
        redirect_to users_path
      else
        redirect_to users_path, notice: "You can't delete yourself!"
      end  
    else
      redirect_to root_path
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
  
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access user section"
      redirect_to root_path
    end
  end
end