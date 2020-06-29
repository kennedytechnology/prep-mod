class SupplyInventoryEvent < ApplicationRecord
  belongs_to :supply_inventory

  validates :quantity_used, :quantity_lost, 
            :quantity_destroyed, :quantity_loaned,
            numericality: {only_integer: true, greater_than: 0, message: "Only number greater than 0 allowed"},
            allow_blank: true
  validates_presence_of :event_date, :event_type
end
