FactoryBot.define do
  factory :provider_enrollment do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.full_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    fax_number { "MyString" }
    email { Faker::Internet.email }
    npi_number { "MyString" }
    license_number { "MyString" }
    license_type { "MyString" }
    medial_specialty { "MyString" }
  end
end
