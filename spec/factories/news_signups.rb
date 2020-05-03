FactoryBot.define do
  factory :news_signup do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    date_of_birth { Faker::Date.birthday }
    zip_code { Faker::Address.zip_code }
    topics { ["Testing", "Screening", "Safety Kit", "Medication", "Other"] }
    occupation {PATIENT_OCCUPATIONS.sample }
  end
end
