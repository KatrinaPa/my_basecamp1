class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, only: [ :index, :make_admin, :remove_admin ]

  def index
    @users = User.all
  end

  def make_admin
    @user = User.find(params[:id])
    @user.update(role: "admin")
    redirect_to users_path, notice: "User was successfully promoted to admin."
  end

  def remove_admin
    @user = User.find(params[:id])
    @user.update(role: "user")
    redirect_to users_path, notice: "User was successfully demoted from admin."
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, alert: "Access denied, you are not an admin."
    end
  end
end
