class AddSignerFieldsToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :signer_first_name, :string
    add_column :patients, :signer_last_name, :string
  end
end
