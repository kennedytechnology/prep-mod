class ChangeProviderEnrollmentColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :provider_enrollments, :practice_backup_contact_email, :practice_backup_email
    rename_column :provider_enrollments, :practice_backup_contact_phone, :practice_backup_phone
    rename_column :provider_enrollments, :fax_number, :practice_fax_number
    remove_column :provider_enrollments, :address, :string
    remove_column :provider_enrollments, :phone_number, :string
    remove_column :provider_enrollments, :email, :string
  end
end
