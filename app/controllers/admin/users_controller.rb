class Admin::UsersController < ApplicationController

  # before_action do
  #   if current_user.id != 1
  #     flash[:notice] = "No Admin for you! RAWR!"
  #     redirect_to '/'
  #   end
  # end

  before_action :require_admin

  def require_admin
      unless current_user.try(:admin?)
        flash[:notice] = "You must be an admin to access this page"
        redirect_to '/'
      end
  end

  def index
    @users = User.all 
  end 
end
