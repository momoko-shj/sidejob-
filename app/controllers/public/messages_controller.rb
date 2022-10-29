class Public::MessagesController < ApplicationController
  
   def create
     if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
       @message = current_user.messages.create!(message_params)
     else
       flash[:alert] = "メッセージ送信に失敗しました。"
     end
     redirect_to mypage_path(current_user)
   end

private

def message_params
    params.require(:message).permit(:user_id, :room_id, :body)
end

   
end
