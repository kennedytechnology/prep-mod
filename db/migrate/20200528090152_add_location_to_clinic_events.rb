class AddLocationToClinicEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :clinic_events, :location, :string
  end
end
