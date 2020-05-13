FactoryBot.define do
  factory :provider_enrollment do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    practice_address { Faker::Address.full_address }
    practice_office_phone { Faker::PhoneNumber.cell_phone }
    practice_fax_number { "MyString" }
    practice_email { Faker::Internet.email }
    npi_number { "MyString" }
    license_number { "MyString" }
    license_type { "MyString" }
    medical_specialty { "MyString" }
  end
end
