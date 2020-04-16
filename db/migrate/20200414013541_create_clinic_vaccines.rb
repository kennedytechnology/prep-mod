class CreateClinicVaccines < ActiveRecord::Migration[6.0]
  def change
    create_table :clinic_vaccines do |t|
      t.integer :clinic_id
      t.integer :vaccine_id
      t.string :vaccine_log_number
      t.integer :number_of_doses
      t.text :comments_incidents
      t.integer :doses_administered
      t.integer :doses_unused
      t.integer :doses_returned
      t.boolean :is_default
      t.string :vaccine_manufacturer

      t.timestamps
    end
  end
end
