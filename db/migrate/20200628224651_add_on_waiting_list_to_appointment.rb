class AddOnWaitingListToAppointment < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :on_waiting_list, :boolean
  end
end
