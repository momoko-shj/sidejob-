class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
    t.integer :user_id, null: false, default: ""
    t.integer :room_id, null: false, default: ""
      t.timestamps
    end
  end
end
