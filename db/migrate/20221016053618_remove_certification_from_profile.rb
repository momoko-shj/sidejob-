class RemoveCertificationFromProfile < ActiveRecord::Migration[6.1]
  def change
    remove_column :profiles, :certification, :integer
  end
end
