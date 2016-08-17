class Admin::UsersController < ApplicationController


  before_action :require_admin

  def require_admin
      unless current_user.try(:admin?)
        flash[:notice] = "You must be an admin to access this page"
        redirect_to '/'
      end
  end

  def index
    @users = User.order(:firstname).page(params[:page]).per(10)
  end 

  def show 
    # byebug
    @message = 'anyhting'
    @user = User.find(params[:id])
  end 



end
