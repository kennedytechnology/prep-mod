class AddMoreQuantityFieldsToSupplyInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :supply_inventories, :quantity_used, :integer
    add_column :supply_inventories, :quantity_lost, :integer
    add_column :supply_inventories, :quantity_loaned, :integer
  end
end
