class AddSignatureNameToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :signature_first_name, :string
    add_column :patients, :signature_last_name, :string
  end
end
