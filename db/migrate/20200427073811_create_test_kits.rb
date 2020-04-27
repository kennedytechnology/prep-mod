class CreateTestKits < ActiveRecord::Migration[6.0]
  def change
    create_table :test_kits do |t|
      t.references :clinic, null: false, foreign_key: true
      t.string :test_name
      t.string :test_manufacturer
      t.string :test_lot_number
      t.string :test_type
      t.string :test_processing
      t.date :test_expiration_date
      t.integer :test_kits_quantity

      t.timestamps
    end
  end
end
