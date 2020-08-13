FactoryBot.define do
  factory :vaccine_event_detail do
    vaccine { "MyString" }
    route { "MyString" }
    site { "MyString" }
    reaction { "MyString" }
    clinic_event_id { 1 }
  end
end
