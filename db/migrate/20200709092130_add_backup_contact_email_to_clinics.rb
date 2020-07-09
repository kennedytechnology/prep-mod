class AddBackupContactEmailToClinics < ActiveRecord::Migration[6.0]
  def change
    add_column :clinics, :backup_contact_email, :string
  end
end
