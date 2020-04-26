class CreateSupplyInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :supply_inventories do |t|
      t.date :received_at
      t.string :item_type
      t.string :item_name
      t.string :manufacturer
      t.string :lot_number
      t.date :expiration_date
      t.integer :quantity
      t.string :packaging
      t.string :source
      t.string :product_name
      t.string :event_type
      t.bigint :clinic_id

      t.timestamps
    end
  end
end
