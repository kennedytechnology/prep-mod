class CreateProviderEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :provider_enrollments do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.string :fax_number
      t.string :email
      t.string :npi_number
      t.string :license_number
      t.string :license_type
      t.string :medial_specialty

      t.timestamps
    end
  end
end
