class RemoveEntryIdFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :entry_id, :integer
  end
end
