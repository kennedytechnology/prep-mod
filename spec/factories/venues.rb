FactoryBot.define do
  factory :venue do
    name { "MyString" }
    address { "MyText" }
    city { "MyString" }
    zip_code { 1 }
    state { "MyString" }
    longitude { 1.5 }
    latitude { 1.5 }
  end
end
