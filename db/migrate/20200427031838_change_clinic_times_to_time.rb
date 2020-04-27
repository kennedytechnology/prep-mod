class ChangeClinicTimesToTime < ActiveRecord::Migration[6.0]
  def change
    remove_column :clinics, :start_time
    add_column :clinics, :start_time, :time
    remove_column :clinics, :end_time
    add_column :clinics, :end_time, :time
  end
end
