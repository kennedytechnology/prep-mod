class SupplyInventory < ApplicationRecord
  has_many :supply_inventory_events
  belongs_to :user

  validates_presence_of :item_type, :product_name, :received_at, :manufacturer,
    :lot_number, :expiration_date, :packaging, :source,
    :county, :venue_name
  
  validates :quantity, numericality: {only_integer: true, greater_than: 0, message: "Only number greater than 0 allowed"}

  validate :received_at_date_cannot_be_in_the_future
  validate :expiration_date_cannot_be_in_the_past

  def received_at_date_cannot_be_in_the_future
    errors.add(:base, "Received date is invalid") if received_at > Date.tomorrow
  end

  def expiration_date_cannot_be_in_the_past
    errors.add(:expiration_date, "is invalid") if expiration_date < Date.yesterday
  end

  def quantity_lost_sum
    supply_inventory_events.sum(:quantity_lost)
  end

  def quantity_used_sum
    supply_inventory_events.sum(:quantity_used)
  end

  def quantity_loaned_sum
    supply_inventory_events.sum(:quantity_loaned)
  end

  def quantity_returned_sum
    supply_inventory_events.sum(:quantity_returned)
  end

  def quantity_destroyed_sum
    supply_inventory_events.sum(:quantity_destroyed)
  end

  def remaining_quantity_sum
    quantity - (quantity_lost_sum + quantity_used_sum + quantity_loaned_sum + quantity_returned_sum + quantity_destroyed_sum)
  end
end
