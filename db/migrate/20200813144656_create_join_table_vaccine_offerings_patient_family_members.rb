class CreateJoinTableVaccineOfferingsPatientFamilyMembers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :vaccine_offerings, :patient_family_members do |t|
      # t.index [:vaccine_offering_id, :patient_family_member_id]
      # t.index [:patient_family_member_id, :vaccine_offering_id]
    end
  end
end
