FactoryBot.define do
  custom_email =  Faker::Internet.unique.email
  factory :user do
    # association :venue, factory: :venue
    before(:create) { |user| user.venues << create(:venue) }

    email { custom_email }
    email_confirmation { custom_email }
    password { 'password' }
    password_confirmation { 'password' }
    role { 'super_admin' }
    # venues { VENUE_TYPES.sample(7) }
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
    clinics { Clinic.all.sample(5) }
  end
end
