class Public::UsersController < ApplicationController

 def mypage
    @profile = current_user.profile
    @messages = current_user.messages.all
 end
 
  private
  
  def user_params
    params.require(:user).permit(:name, :identification, :phone, :postal_code, :prefecture, :city, :town, :is_deleted)
  end
  
  def profile_params
    params.require(:profile).permit(:user_id, :birthday, :education, :introduction, :skill, :certification, :other_certification, :additional_information, :is_active, :image)
  end
  
end
