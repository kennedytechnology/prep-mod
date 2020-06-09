class SupplyInventory < ApplicationRecord
  validates :item_type, :product_name, presence: true
  has_many :supply_inventory_events

  def quantity_lost_sum
    supply_inventory_events.sum(:quantity_lost)
  end

  def quantity_used_sum
    supply_inventory_events.sum(:quantity_used)
  end

  def quantity_loaned_sum
    supply_inventory_events.sum(:quantity_loaned)
  end

  def remaining_quantity_sum
    quantity - (quantity_lost_sum + quantity_used_sum + quantity_loaned_sum)
  end
end
