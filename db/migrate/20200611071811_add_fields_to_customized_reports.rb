class AddFieldsToCustomizedReports < ActiveRecord::Migration[6.0]
  def change
    add_column :customized_reports, :county, :string
    add_column :customized_reports, :patients_screened, :boolean
    add_column :customized_reports, :patients_tested, :boolean
    add_column :customized_reports, :pending_patients, :boolean
    add_column :customized_reports, :safety_kit, :boolean
    add_column :customized_reports, :gender, :boolean
    add_column :customized_reports, :race, :boolean
    add_column :customized_reports, :zip_code, :boolean
    add_column :customized_reports, :insurance_type, :boolean
    add_column :customized_reports, :age, :boolean
    add_column :customized_reports, :date_of_birth, :boolean
    add_column :customized_reports, :vaccine_name_and_lot_number, :boolean
    add_column :customized_reports, :registration_date, :boolean
    add_column :customized_reports, :user_id, :bigint
    add_column :customized_reports, :clinic_id, :bigint
  end
end
