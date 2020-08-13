class CreateVaccineEventDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccine_event_details do |t|
      t.string :vaccine
      t.string :route
      t.string :site
      t.string :reaction
      t.integer :clinic_event_id

      t.timestamps
    end
  end
end
