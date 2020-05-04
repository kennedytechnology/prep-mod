FactoryBot.define do
  factory :clinic_event do
    association :clinic, factory: :clinic
    association :patient, factory: :patient
    association :user, factory: :user

    clinic_event = CLINIC_EVENTS.sample

    category { clinic_event[:name] } 
    clinic_staff_id { clinic.clinic_personnel.sample }
    outcome { clinic_event[:outcome] }
    created_at { Faker::Date.between(from: 30.days.ago, to: Date.today) }
    notes { Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 2, supplemental: true) }
  end
end
