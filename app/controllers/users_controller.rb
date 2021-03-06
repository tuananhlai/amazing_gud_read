class UsersController < ApplicationController
  before_action :is_admin?

  def index
    @users = User.all
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :index
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to users_path
    else
      render :index
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
  
  def user_params
    params.require(:user).permit(:name)
  end
end
