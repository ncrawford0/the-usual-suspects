class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @admins = Admin.all
    @bars = Bar.all
    @reviews = Review.all
  end

  def make_admin
    @user = User.find(params[:user_id])
    @admin = Admin.new(
      email: @user.email,
      password: 'placeholder',
      encrypted_password: @user.encrypted_password
    )
    if @admin.save
      flash[:notice] = "Admin Added"
    else
      unless Admin.find_by(email: @admin.email).nil?
        flash[:notice] = "#{@admin.email} is already admin"
      end
    end
    redirect_to admins_path
  end

  def destroy
    @admin = Admin.find(params['id'])
    @admin.delete
    flash[:notice] = "Admin Removed"
    redirect_to admins_path
  end

end
