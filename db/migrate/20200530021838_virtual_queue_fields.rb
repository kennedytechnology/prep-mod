class VirtualQueueFields < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :queue_state, :string
    add_column :patients, :notification_preferences, :string
    add_column :patients, :check_in_code, :string
    add_column :clinics, :open_state, :string
    add_column :clinics, :active_queue_patients_count, :integer
  end
end
