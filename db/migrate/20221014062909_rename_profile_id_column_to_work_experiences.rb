class RenameProfileIdColumnToWorkExperiences < ActiveRecord::Migration[6.1]
  def change
    rename_column :work_experiences, :profile_id, :user_id
  end
end
