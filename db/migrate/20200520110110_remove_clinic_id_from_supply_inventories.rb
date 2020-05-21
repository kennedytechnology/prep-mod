class RemoveClinicIdFromSupplyInventories < ActiveRecord::Migration[6.0]
  def change

    remove_column :supply_inventories, :clinic_id, :bigint
  end
end
