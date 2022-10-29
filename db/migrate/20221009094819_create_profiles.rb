class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false, default: ""
      t.date :birthday
      t.string :education
      t.text :introduction
      t.text :skill
      t.integer :certification
      t.text :other_certification
      t.text :additional_information
      t.boolean :is_active, null: false, default: false

      t.timestamps
    end
  end
end
