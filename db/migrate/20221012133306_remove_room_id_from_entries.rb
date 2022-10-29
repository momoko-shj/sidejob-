class RemoveRoomIdFromEntries < ActiveRecord::Migration[6.1]
  def change
    remove_column :entries, :room_id, :integer
  end
end
