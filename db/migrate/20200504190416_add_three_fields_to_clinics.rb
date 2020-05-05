class AddThreeFieldsToClinics < ActiveRecord::Migration[6.0]
  def change
    add_column :clinics, :start_hour_minute, :time
    add_column :clinics, :end_hour_minute, :time
    add_column :clinics, :location, :string
  end
end
