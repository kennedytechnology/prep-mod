class CreateInventoryAllocations < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory_allocations do |t|
      t.integer :clinic_id
      t.integer :supply_inventory_id
      t.integer :allocated_count

      t.timestamps
    end
  end
end
