class AddMiddleInitialToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :middle_initial, :string
  end
end
