FactoryBot.define do
  factory :clinic do
    association :provider_enrollment, factory: :provider_enrollment

    venue_name { Faker::University.unique.name }
    clinic_date { Faker::Date.between(from: 1.month.ago, to: 6.months.from_now) }
    lead_vaccinator_name { Faker::Name.unique.name }
    students_registered { Faker::Number.normal(mean: 100, standard_deviation: 50) }
    clinic_status { %w(Pending Completed Cancelled).sample }
    outcome_comments { Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 9, supplemental: true) }
    incidents_comments { Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 9, supplemental: true) }
    start_time { "#{(9..12).to_a.sample}:00" }
    end_time { "#{(13..17).to_a.sample}:00" }
    duration { 180 }
    age_groups { ClinicAgeGroup.all.sample(rand(ClinicAgeGroup.count) + 1) }
    services { ClinicService.all.sample(rand(ClinicService.count) + 1) }
    address { "8117 Mountain View Circle, Pasadena, MD 21122"  }
    longitude { -76.567383 }
    latitude { 39.133262 }
    appointment_frequency_minutes { [10, 15, 30, 60].sample }
    appointment_slots { (2..10).to_a.sample }
    appointments_available { 'required' }
    county { COUNTIES.sample }
  end
end
