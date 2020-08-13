FactoryBot.define do
  factory :inventory_allocation do
    clinic_id { 1 }
    supply_inventory_id { 1 }
    allocated_count { 1 }
  end
end
