FactoryBot.define do
  factory :employer do
    screening_info { Faker::Boolean.boolean }
    testing_info { Faker::Boolean.boolean }
    vacination_info { Faker::Boolean.boolean }
    other_info { Faker::Boolean.boolean }
    business_locations { BUSINESS_LOCATIONS.sample(rand(4)) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
    position { "position 5" }
    company_name { Faker::Company.name }
    address_1 { Faker::Address.full_address }
    address_2 { Faker::Address.full_address }
    city { Faker::Address.city }
    zip_code { Faker::Address.zip_code }
    state { Faker::Address.state }
    office_phone { Faker::PhoneNumber.cell_phone }
    mobile_phone { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    website { Faker::Internet.url }
    backup_first_name { Faker::Name.first_name }
    backup_last_name { Faker::Name.first_name }
    backup_position { "backup position 5" } 
    backup_company_name { Faker::Company.name }
    backup_address_1 { Faker::Address.full_address }
    backup_address_2 { Faker::Address.full_address }
    backup_city { Faker::Address.city }
    backup_zip_code { Faker::Address.zip_code }
    backup_state { Faker::Address.state }
    backup_office_phone { Faker::PhoneNumber.cell_phone }
    backup_mobile_phone { Faker::PhoneNumber.cell_phone }
    backup_email { Faker::Internet.email }
    total_employees { Faker::Number.between(from: 5, to: 50) }
    total_locations { Faker::Number.between(from: 5, to: 10) }
  end
end
