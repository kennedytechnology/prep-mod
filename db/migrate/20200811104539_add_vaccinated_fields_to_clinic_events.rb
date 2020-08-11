class AddVaccinatedFieldsToClinicEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :clinic_events, :vaccine_route, :string
    add_column :clinic_events, :vaccine_site, :string
    add_column :clinic_events, :vaccine_reaction, :string
  end
end
