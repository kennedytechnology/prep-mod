class CreateClinicPrimaryGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :clinic_primary_groups do |t|
      t.string :seniors
      t.string :african_americans
      t.string :hispanics
      t.string :chronically_ill

      t.timestamps
    end
  end
end
