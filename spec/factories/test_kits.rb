FactoryBot.define do
  factory :test_kit do
    clinic { nil }
    test_name { "MyString" }
    test_manufacturer { "MyString" }
    test_lot_number { "MyString" }
    test_type { "MyString" }
    test_processing { "MyString" }
    test_expiration_date { "2020-04-27" }
  end
end
