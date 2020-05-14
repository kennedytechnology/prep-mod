class RenameColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :clinic_primary_groups, :hispanics, :name
  end
end
