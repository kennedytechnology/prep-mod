class AddRemainingFieldsToPatientFamilyMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :patient_family_members, :has_fever_over, :boolean
    add_column :patient_family_members, :has_cough, :boolean
    add_column :patient_family_members, :has_difficult_breathing, :boolean
    add_column :patient_family_members, :had_traveled_to_affected_place, :boolean
    add_column :patient_family_members, :had_contact_with_confirmed_case, :boolean
    add_column :patient_family_members, :has_risk_factor, :boolean
    add_column :patient_family_members, :is_age_60_or_more, :boolean
    add_column :patient_family_members, :has_other_reason, :boolean
  end
end
