class AddClinicIdToSupplyInventoryEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :supply_inventory_events, :clinic_id, :integer
  end
end
