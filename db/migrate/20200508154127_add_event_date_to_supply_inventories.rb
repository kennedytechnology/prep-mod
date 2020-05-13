class AddEventDateToSupplyInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :supply_inventories, :event_date, :date
  end
end
