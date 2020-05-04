FactoryBot.define do
  factory :clinic_service do
    name { ["Screening", "Testing", "Medication", "Safety Kit Distribution", "Other"].sample }
  end
end
