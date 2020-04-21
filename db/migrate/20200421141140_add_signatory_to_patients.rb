class AddSignatoryToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :signatory_first_name, :string
    add_column :patients, :signatory_last_name, :string
  end
end
