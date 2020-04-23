class AddInsuredFirstAndLastNameToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :insured_first_name, :string
    add_column :patients, :insured_last_name, :string
  end
end
