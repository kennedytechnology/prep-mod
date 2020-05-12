class AddFieldsToProviderEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_enrollments, :title, :string
    add_column :provider_enrollments, :practice_name, :string
    add_column :provider_enrollments, :practice_address, :string
    add_column :provider_enrollments, :practice_city, :string
    add_column :provider_enrollments, :practice_state, :string
    add_column :provider_enrollments, :practice_zip, :integer
    add_column :provider_enrollments, :practice_office_phone, :string
    add_column :provider_enrollments, :practice_phone_number, :string
    add_column :provider_enrollments, :practice_email, :string
    add_column :provider_enrollments, :practice_backup_contact, :string
    add_column :provider_enrollments, :practice_backup_contact_phone, :string
    add_column :provider_enrollments, :practice_backup_contact_email, :string
    add_column :provider_enrollments, :population_served, :string
    add_column :provider_enrollments, :high_risk_group_served, :string
    add_column :provider_enrollments, :does_provide_vaccination, :boolean
    add_column :provider_enrollments, :does_provide_vfc, :boolean
    add_column :provider_enrollments, :refrigerator, :string
    add_column :provider_enrollments, :refrigerator_thermometer, :string
    add_column :provider_enrollments, :additional_info, :text
  end
end
