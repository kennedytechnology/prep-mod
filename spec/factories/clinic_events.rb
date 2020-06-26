FactoryBot.define do
  factory :clinic_event do
    association :clinic, factory: :clinic
    association :patient, factory: :patient
    association :user, factory: :user

    category { CLINIC_EVENTS.first[:name] } 
    clinic_staff_id { clinic.clinic_personnel.sample }
    outcome {  CLINIC_EVENTS.first[:outcomes].sample }
    created_at { Faker::Date.between(from: 30.days.ago, to: Date.today) }
    event_date { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    location { Faker::Address.street_address }
    notes { Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 2, supplemental: true) }
  end
end
