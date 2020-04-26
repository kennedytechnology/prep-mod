FactoryBot.define do
  factory :supply_inventory do
    received_at { "2020-04-23" }
    item_type { "MyString" }
    item_name { "MyString" }
    manufacturer { "MyString" }
    lot_number { "MyString" }
    expiration_date { "2020-04-23" }
    quantity { 1 }
    packaging { "MyString" }
    source { "MyString" }
    product_name { "MyString" }
    client { "" }
  end
end
