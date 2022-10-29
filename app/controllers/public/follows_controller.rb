class Public::FollowsController < ApplicationController
  
  def create
    profile = Profile.find(params[:profile_id])
    follow = current_user.follows.new(profile_id: profile.id)
    follow.save
    redirect_to profile_path(profile)
  end
  
  def destroy
    profile = Profile.find(params[:profile_id])
    follow = current_user.follows.find_by(profile_id: profile.id)
    follow.destroy
    redirect_to profile_path(profile)
  end
  
  private
   
  def follow_params
    params.require(:follow).permit(:user_id, :profile_id)
  end

end
