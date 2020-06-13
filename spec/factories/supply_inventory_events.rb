FactoryBot.define do
  factory :supply_inventory_event do
    association :supply_inventory, factory: :supply_inventory
    event_date { "2020-05-26" }
    event_type { "MyString" }
    quantity_used { 1 }
    quantity_lost { 1 }
    quantity_loaned { 1 }
    quantity_destroyed { 1 }
  end
end
