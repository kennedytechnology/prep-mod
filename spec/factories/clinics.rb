FactoryBot.define do
  factory :clinic do
    association :provider_enrollment, factory: :provider_enrollment
    association :venue, factory: :venue

    before(:create) { |clinic| clinic.services << create(:clinic_service) }
    before(:create) { |clinic| clinic.age_groups << create(:clinic_age_group) }

    venue_name { Faker::University.unique.name }
    state { US_STATES.sample }
    city { "Odenton" }
    zip { 22111 }
    lead_vaccinator_name { Faker::Name.unique.name }
    public_or_private {%w(Public Private).sample}
    clinic_status { %w(Pending Completed Cancelled).sample }
    outcome_comments { Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 9, supplemental: true) }
    incidents_comments { Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 9, supplemental: true) }
    start_time { "0#{(1..2).to_a.sample}:00" }
    end_time { "0#{(3..4).to_a.sample}:00" }
    duration { 180 }
    address { "8117 Mountain View Circle, Pasadena, MD 21122"  }
    longitude { -76.567383 }
    latitude { 39.133262 }
    location { "Nowhere" }
    appointment_frequency_minutes { [10, 15, 30, 60].sample }
    appointment_slots { (2..10).to_a.sample }
    appointments_available { 'required' }
    county { COUNTIES.sample }
    venue_type { VENUE_TYPES.sample }
    social_distancing { 1 }
    active_queue_patients_count { 1 }
    contact_person { "Contact Person" }
    contact_phone_number { "111222333" }
    backup_contact_person { "Backup Contact Person" }
    backup_contact_phone_number { "222333444" }
    backup_contact_email { "contact@email.com" }
  end
end
