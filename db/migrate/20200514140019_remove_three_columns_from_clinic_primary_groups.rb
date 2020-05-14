class RemoveThreeColumnsFromClinicPrimaryGroups < ActiveRecord::Migration[6.0]
  def change

    remove_column :clinic_primary_groups, :seniors, :string

    remove_column :clinic_primary_groups, :african_americans, :string

    remove_column :clinic_primary_groups, :chronically_ill, :string
  end
end
