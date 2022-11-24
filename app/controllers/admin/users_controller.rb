class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @work_experience = @user.work_experiences.all
  end
  
  def index
    @users = User.all
  end
  
  
 def withdraw
  @user = User.find(params[:id])
  if @user.is_deleted
    @user.update(is_deleted: false)
  else
    @user.update(is_deleted: true)
  end
  reset_session
  redirect_to  admin_mypage_path
 end

  # def edit
  #   @user = User.find(params[:id])
  # end
  
  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     redirect_to admin_mypage_path
  #   else
  #     render:edit
  #   end
  # end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :identification, :phone, :postal_code, :prefecture, :city, :town, :is_deleted)
  end
  
end
