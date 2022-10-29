class RenameMessageColumnToMessages < ActiveRecord::Migration[6.1]
  def change
    rename_column :messages, :message, :body
  end
end
