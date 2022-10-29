class Public::RoomsController < ApplicationController
 
  def create
    room = Room.create
    Entry.create(room_id: room.id, user_id: current_user.id)
    Entry.create(params.require(:room).permit(:user_id, :room_id).merge(room_id: room.id))
    redirect_to room_path(room)
  end
  
  def show
  @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id,room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: room_path)
    end
  end
 
# def index
#   @rooms = current_user.rooms.all
   
# end
  
  private
  
  def room_params
    params.require(:room).permit(:is_block)
  end
  
end
