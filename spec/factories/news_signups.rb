FactoryBot.define do
  factory :news_signup do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    date_of_birth { Faker::Date.birthday }
    zip_code { Faker::Address.zip_code }
    topics { NEWS_TOPICS }
    occupation {PATIENT_OCCUPATIONS.sample }
    chronic_health_condition {  Faker::Boolean.boolean }
  end
end
