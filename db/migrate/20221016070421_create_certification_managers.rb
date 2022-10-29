class CreateCertificationManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :certification_managers do |t|
      t.integer :profile_id
      t.integer :certification_id

      t.timestamps
    end
  end
end
