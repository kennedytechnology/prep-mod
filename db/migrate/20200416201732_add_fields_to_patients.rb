class AddFieldsToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :state, :string
    add_column :patients, :county, :string
    add_column :patients, :city, :string
    add_column :patients, :zip_code, :integer
    add_column :patients, :first_name, :string
    add_column :patients, :last_name, :string
    add_column :patients, :mothers_maiden_name, :string
    add_column :patients, :address, :string
    add_column :patients, :email, :string
    add_column :patients, :email_confirmation, :string
    add_column :patients, :date_of_birth, :date
    add_column :patients, :sex, :string
    add_column :patients, :phone_number, :string
    add_column :patients, :insured_first_name, :string
    add_column :patients, :insured_last_name, :string
    add_column :patients, :insured_date_of_birth, :date
    add_column :patients, :relation_to_patient_for_insurance, :string
    add_column :patients, :insurance_type, :string
    add_column :patients, :member_id_for_insurance, :integer
    add_column :patients, :card_number_for_insurance, :string
    add_column :patients, :insurance_company_name, :text
    add_column :patients, :group_number_for_insurance, :string
    add_column :patients, :has_fever_over, :boolean
    add_column :patients, :has_caugh, :boolean
    add_column :patients, :has_difficult_breathing, :boolean
    add_column :patients, :had_contact_with_confirmed_case, :boolean
    add_column :patients, :is_age_60_or_more, :boolean
    add_column :patients, :had_traveled_to_affected_place, :boolean
    add_column :patients, :has_risk_factor, :boolean
    add_column :patients, :consent_signature, :string
    add_column :patients, :relation_to_patient_for_consent, :string
    add_column :patients, :consent_date, :string
  end
end
