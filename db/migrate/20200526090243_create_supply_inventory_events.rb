class CreateSupplyInventoryEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :supply_inventory_events do |t|
      t.date :event_date
      t.string :event_type
      t.integer :quantity_used
      t.integer :quantity_lost
      t.integer :quantity_loaned
      t.integer :quantity_destroyed
      t.string :county
      t.string :venue_name
      t.references :supply_inventory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
