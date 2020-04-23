class RemoveInsuredNameFromPatients < ActiveRecord::Migration[6.0]
  def change

    remove_column :patients, :insured_name, :string
  end
end
