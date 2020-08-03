class AddCategoryToSupplyInventory < ActiveRecord::Migration[6.0]
  def change
    add_column :supply_inventories, :category, :string
  end
end
