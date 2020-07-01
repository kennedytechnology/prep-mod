class AddQuantityReturnedToSupplyInventoryEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :supply_inventory_events, :quantity_returned, :integer
  end
end
