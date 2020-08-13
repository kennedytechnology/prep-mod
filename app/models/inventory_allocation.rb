class InventoryAllocation < ApplicationRecord
  belongs_to :clinic
  belongs_to :supply_inventory
end
