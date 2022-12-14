class Public::UsersController < ApplicationController
  
  # ユーザー登録情報　サイトでは公開されない

 def mypage
    @profile = current_user.profile
    @follows = current_user.follows.all
    @comments = current_user.comments.all
    @rooms = current_user.rooms.all
    @messages = @rooms.map{|x| x.messages.where.not(user_id: current_user.id)}.flatten!
 end
 
 def edit
   @user = User.find(params[:id])
 end
 
 def update
   @user = User.find(params[:id])
   @user.update(user_params) ? (redirect_to mypage_path) : (render edit) 
 end

 def unsubscribe
 end

 def withdraw
 current_user.update(is_deleted: true)
 reset_session
 flash[:notice] = "退会処理を行いました。"
 redirect_to root_path
 end
 
  private
  
  def user_params
    params.require(:user).permit(:name, :identification, :phone, :postal_code, :prefecture, :city, :town, :is_deleted)
  end
  
  def profile_params
    params.require(:profile).permit(:user_id, :birthday, :education, :introduction, :skill, :certification, :other_certification, :additional_information, :is_active, :image)
  end
  
end
