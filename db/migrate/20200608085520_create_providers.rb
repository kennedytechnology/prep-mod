class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :first_name
      t.string :last_name
      t.string :practice_fax_number
      t.string :npi_number
      t.string :license_number
      t.string :license_type
      t.string :medical_specialty
      t.string :professional_license
      t.date :license_date_of_issue
      t.string :title
      t.string :practice_name
      t.string :practice_address
      t.string :practice_city
      t.string :practice_state
      t.integer :practice_zip_code
      t.string :practice_office_phone
      t.string :practice_mobile_phone
      t.string :practice_email
      t.string :practice_backup_contact
      t.string :practice_backup_office_phone
      t.string :practice_backup_email
      t.string :freezer
      t.string :high_risk_group_served
      t.boolean :does_provide_vaccination
      t.boolean :does_provide_vfc
      t.string :refrigerator
      t.string :refrigerator_thermometer
      t.text :additional_info
      t.string :middle_initial
      t.string :practice_type
      t.string :contact_office_phone
      t.string :contact_mobile_phone
      t.string :contact_email
      t.string :practice_backup_mobile_phone
      t.string :county
      t.string :unique_number

      t.timestamps
    end
  end
end
