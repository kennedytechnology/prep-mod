class AddReminderSentAtToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :reminder_sent_at, :datetime
  end
end
