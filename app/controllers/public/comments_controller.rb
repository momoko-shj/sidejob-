class Public::CommentsController < ApplicationController
  
  # プロフィールにコメントを記述する
  
  def create
    profile = Profile.find(params[:profile_id])
    text = current_user.comments.new(comment_params)
    text.profile_id = profile.id
    text.save
    redirect_to profile_path(profile)
  end
  
  def destroy
    @comment = Comment.find(params[:profile_id])
    @comment.destroy
    redirect_to profile_path(:profile_id)
  end

private

def comment_params
  params.require(:comment).permit(:text,:user_id,:profile_id)
end
  
end
