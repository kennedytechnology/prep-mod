class AddSignatureDataToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :signature_data, :text
  end
end
