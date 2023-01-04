class CreateWorkExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :work_experiences do |t|
      t.integer :profile_id, null: false
      t.string :company_name
      t.integer :industory_type
      t.date :joined_date
      t.integer :position
      t.text :career_history

      t.timestamps
    end
  end
end
