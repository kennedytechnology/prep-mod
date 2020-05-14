class RenamePracticeBackupPhoneToPracticeBackupOfficePhone < ActiveRecord::Migration[6.0]
  def change
    rename_column :provider_enrollments, :practice_backup_phone, :practice_backup_office_phone
  end
end
