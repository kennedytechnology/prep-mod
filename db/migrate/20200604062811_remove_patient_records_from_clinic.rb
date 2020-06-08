class RemovePatientRecordsFromClinic < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :clinic_id
    remove_column :patients, :appointment_time
  end
end
