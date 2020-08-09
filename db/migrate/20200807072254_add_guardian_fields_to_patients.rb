class AddGuardianFieldsToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :guardian_first_name, :string
    add_column :patients, :guardian_last_name, :string
    add_column :patients, :guardian_email, :string
  end
end
