class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false, default: ""
      t.integer :profile_id, null: false, default: ""
      t.text :comment, null: false, default: ""
      t.timestamps
    end
  end
end