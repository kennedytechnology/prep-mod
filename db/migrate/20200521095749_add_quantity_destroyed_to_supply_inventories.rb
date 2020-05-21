class AddQuantityDestroyedToSupplyInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :supply_inventories, :quantity_destroyed, :integer
  end
end
