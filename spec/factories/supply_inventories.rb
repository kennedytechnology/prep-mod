FactoryBot.define do
  factory :supply_inventory do
    received_at { Faker::Date.between(from: 30.days.ago, to: Date.today) }
    item_type { INVENTORY_ITEM_TYPES.sample }
    item_name { "Item Name" }
    manufacturer { INVENTORY_MANUFACTURERS.sample }
    lot_number { "x34RghY" }
    expiration_date { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    quantity { 1 }
    packaging { INVENTORY_PACKAGINGS.sample }
    source { INVENTORY_SOURCES.sample }
    product_name { "Product Name" }
    county { COUNTIES.unshift("All").sample }
    venue_name { Clinic.pluck(:venue_name).unshift("All").sample }

    factory :invalid_supply_inventory do
      item_name {""}
      item_type {""}
    end
  end
end
