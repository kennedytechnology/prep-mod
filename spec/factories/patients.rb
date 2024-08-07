FactoryBot.define do
  factory :patient do
    # association :clinic, factory: :clinic
    # association :appointment, factory: :appointment
    association :user, factory: :user

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_initial { ("A".."Z").to_a.sample }
    mothers_maiden_name { Faker::Name.last_name }
    age { (3..80).to_a.sample }
    email { "patient@example.com" }
    date_of_birth { Faker::Date.birthday }
    address { "3440 Brookhaven Road" }
    city { "Pasadena" }
    state { "MD" }
    zip_code { 21122 }
    county { COUNTIES.sample }
    access_code { Patient.generate_access_code }
    sex { %w(M F).sample }
    phone_number { "+14075366339" }
    student_id { Faker::IDNumber.unique }
    user_id { Faker::IDNumber.unique }
    email_confirmation { "patient@example.com" }
    notify_via_sms { Faker::Boolean.boolean }
    notify_via_email { Faker::Boolean.boolean }
    signer_first_name { Faker::Name.first_name }
    signer_last_name { Faker::Name.last_name }
  end
end
