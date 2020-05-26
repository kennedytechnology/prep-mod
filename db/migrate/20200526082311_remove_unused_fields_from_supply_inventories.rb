class RemoveUnusedFieldsFromSupplyInventories < ActiveRecord::Migration[6.0]
  def change

    remove_column :supply_inventories, :event_type, :string

    remove_column :supply_inventories, :quantity_used, :integer

    remove_column :supply_inventories, :quantity_lost, :integer

    remove_column :supply_inventories, :quantity_loaned, :integer

    remove_column :supply_inventories, :event_date, :date

    remove_column :supply_inventories, :quantity_destroyed, :integer

    remove_column :supply_inventories, :county, :string

    remove_column :supply_inventories, :venue_name, :string
  end
end
