class AddNumberOfItemsToSupplyInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :supply_inventories, :number_of_items, :integer
  end
end
