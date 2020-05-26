class CreatePatientFamilyMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_family_members do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :mothers_maiden_name
      t.string :race
      t.date :date_of_birth
      t.string :insurance_company_name
      t.string :member_id_for_insurance
      t.string :group_number_for_insurance
      t.integer :patient_id

      t.timestamps
    end
  end
end
