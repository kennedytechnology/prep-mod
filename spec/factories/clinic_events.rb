FactoryBot.define do
  factory :clinic_event do
    clinic_id { 1 }
    patient_id { 1 }
    category { "MyString" }
    outcome { "MyString" }
    notes { "MyText" }
  end
end
