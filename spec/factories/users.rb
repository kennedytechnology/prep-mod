FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'password' }
    password_confirmation { 'password' }
    role { USER_ROLES.sample }
    name { Faker::Name.unique.name }
    clinics { Clinic.all.sample(5) }
  end
end
