class AddHasOtherReasonExplanationToPatientFamilyMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :patient_family_members, :has_other_reason_explanation, :text
  end
end
