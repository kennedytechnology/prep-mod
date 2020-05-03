FactoryBot.define do
  factory :clinic_staff do
    association :clinic, factory: :clinic
    name { Faker::Name.name }
  end
end
