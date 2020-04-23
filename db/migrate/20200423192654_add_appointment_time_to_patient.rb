class AddAppointmentTimeToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :appointment_time, :string
  end
end
