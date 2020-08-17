class AddCountyToPatientFamilyMember < ActiveRecord::Migration[6.0]
  def change
    add_column :patient_family_members, :county, :string
  end
end
