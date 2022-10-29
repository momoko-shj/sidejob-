class RenameUserIdColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :user_id, :entry_id
  end
end
