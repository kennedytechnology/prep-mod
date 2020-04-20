class AddNotificationPreferencesToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :notify_via_sms, :boolean
    add_column :patients, :notify_via_email, :boolean
  end
end
