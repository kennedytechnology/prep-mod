class ChangeClinicLocationToVenue < ActiveRecord::Migration[6.0]
  def change
    remove_column :clinics, :location
    add_column :clinics, :venue_name, :string
  end
end
