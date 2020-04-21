class RenameCaughToCough < ActiveRecord::Migration[6.0]
  def change
    rename_column :patients, :has_caugh, :has_cough
  end
end
