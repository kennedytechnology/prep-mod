class AddAppointmentsCountToClinics < ActiveRecord::Migration[6.0]
  def change
    add_column :clinics, :appointments_count, :integer
  end
end
