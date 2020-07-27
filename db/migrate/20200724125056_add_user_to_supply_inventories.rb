class AddUserToSupplyInventories < ActiveRecord::Migration[6.0]
  def change
    add_reference :supply_inventories, :user, foreign_key: true
  end
end
