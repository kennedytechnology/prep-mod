class MoveQueueStateToAppointments < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :queue_state
    add_column :appointments, :queue_state, :string
  end
end
