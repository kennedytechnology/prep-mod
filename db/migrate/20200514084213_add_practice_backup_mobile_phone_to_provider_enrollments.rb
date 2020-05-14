class AddPracticeBackupMobilePhoneToProviderEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_enrollments, :practice_backup_mobile_phone, :string
  end
end
