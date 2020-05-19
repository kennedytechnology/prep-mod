class AddCountyAndVenueNameToSupplyInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :supply_inventories, :county, :string
    add_column :supply_inventories, :venue_name, :string
  end
end
