class SupplyInventory < ApplicationRecord
  has_many :supply_inventory_events

  validates_presence_of :item_type, :product_name, :received_at, :manufacturer,
    :lot_number, :expiration_date, :packaging, :source,
    :county, :venue_name
  
  validates :quantity, numericality: {only_integer: true, greater_than: 0, message: "Only number greater than 0 allowed"}

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
