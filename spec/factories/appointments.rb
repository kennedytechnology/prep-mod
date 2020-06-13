FactoryBot.define do
  factory :appointment do
    association :clinic, factory: :clinic
    association :patient, factory: :patient
    appointment_at { "2020-06-04 01:54:24" }
  end
end
