FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    email_confirmation { Faker::Internet.unique.email }
    password { 'password' }
    password_confirmation { 'password' }
    role { 'super_admin' }
    venues { VENUE_TYPES.sample(7) }
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
    clinics { Clinic.all.sample(5) }
  end
end
