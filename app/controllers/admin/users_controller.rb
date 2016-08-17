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
    @user = User.find(params[:id])
  end 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path
    else 
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
    UserMailer.delete_email(@user).deliver_now
  end

  protected 

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end


end
