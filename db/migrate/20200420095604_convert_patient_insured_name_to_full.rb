class ConvertPatientInsuredNameToFull < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :insured_first_name
    remove_column :patients, :insured_last_name
    add_column :patients, :insured_name, :string
  end
end
