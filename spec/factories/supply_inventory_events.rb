FactoryBot.define do
  factory :supply_inventory_event do
    event_date { "2020-05-26" }
    event_type { "MyString" }
    quantity_used { 1 }
    quantity_lost { 1 }
    quantity_loaned { 1 }
    quantity_destroyed { 1 }
    supply_inventory { nil }
  end
end
