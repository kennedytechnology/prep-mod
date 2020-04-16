FactoryBot.define do
  factory :venue do
    named_place
    name { Faker::University.unique.name }
    type { "University" }
  end
end
