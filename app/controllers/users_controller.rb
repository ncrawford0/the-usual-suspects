class UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params['id'])
    @user.delete
    flash[:notice] = "User Deleted"
    redirect_to users_path
  end
end
