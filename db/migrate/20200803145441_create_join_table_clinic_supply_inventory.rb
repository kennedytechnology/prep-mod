class CreateJoinTableClinicSupplyInventory < ActiveRecord::Migration[6.0]
  def change
    create_join_table :clinics, :supply_inventories do |t|
      # t.index [:clinic_id, :supply_inventory_id]
      # t.index [:supply_inventory_id, :clinic_id]
    end
  end
end
