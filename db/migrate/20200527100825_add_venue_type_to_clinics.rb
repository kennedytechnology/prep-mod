class AddVenueTypeToClinics < ActiveRecord::Migration[6.0]
  def change
    add_column :clinics, :venue_type, :string
  end
end
