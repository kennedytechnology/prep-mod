class AddQuantityReturnedToSupplyInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :supply_inventories, :quantity_returned, :integer
  end
end
