class AddRemainingFieldsToClinics < ActiveRecord::Migration[6.0]
  def change
    add_column :clinics, :county, :string
    add_column :clinics, :location, :string
    add_column :clinics, :zip, :string
    add_column :clinics, :city, :string
    add_column :clinics, :state, :string
    add_column :clinics, :contact_person, :string
    add_column :clinics, :contact_phone_number, :string
    add_column :clinics, :backup_contact_person, :string
    add_column :clinics, :backup_contact_phone_number, :string
    add_column :clinics, :appointment_frequency_minutes, :string
    add_column :clinics, :appointment_slots, :string
    add_column :clinics, :appointments_available, :string
  end
end
