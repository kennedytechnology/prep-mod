class AddVenueIdToPatientFamilyMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :patient_family_members, :venue_id, :integer
  end
end
