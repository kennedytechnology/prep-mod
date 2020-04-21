class CreateClinicEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :clinic_events do |t|
      t.integer :clinic_id
      t.integer :patient_id
      t.integer :clinic_staff_id
      t.string :category
      t.string :outcome
      t.integer :inventory_item_id
      t.string :inventory_item_name
      t.text :notes

      t.timestamps
    end
  end
end
