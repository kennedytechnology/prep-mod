# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NAMED_PLACE_COUNT = 15
VENUE_COUNT = 100
CLINIC_COUNT = 230
USER_COUNT = 50
VENUE_STATES = ["MD", "DC"]

NAMED_PLACE_COUNT.times.each do |i|
  NamedPlace.create(
    name: Faker::JapaneseMedia::OnePiece.unique.island
  )
end

["Screening", "Testing", "Medication", "Safety Kit Distribution", "Other"].each do |name|
  ClinicService.create!(name: name)
end

["All Ages", "Children", "Adults", "Seniors", "Other"].each do |name|
  ClinicAgeGroup.create!(name: name)
end

addresses = JSON.load(Rails.root.join("db/addresses.json"))["addresses"]
addresses.select!{|a| VENUE_STATES.include?(a["state"])}
addresses.shuffle!

VENUE_COUNT.times.each do |i|
  Venue.create(
    named_place: NamedPlace.all.sample,
    name: Faker::University.unique.name,
    venue_category: "University"
  )
end

CLINIC_COUNT.times.each do |i|
  address = addresses.pop
  Clinic.create(
    venue: Venue.all.sample,
    clinic_date: Faker::Date.between(from: 1.month.ago, to: 6.months.from_now),
    lead_vaccinator_name: Faker::Name.unique.name,
    students_registered: Faker::Number.normal(mean: 100, standard_deviation: 50),
    clinic_status: %w(Pending Completed Cancelled).sample,
    outcome_comments: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 9, supplemental: true),
    incidents_comments: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 9, supplemental: true),
    start_time: "10:00",
    end_time: "13:00",
    duration: 180,
    age_groups: ClinicAgeGroup.all.sample(rand(ClinicAgeGroup.count) + 1),
    services: ClinicService.all.sample(rand(ClinicService.count) + 1),
    address: "#{address['address1']}, #{address['city']}, #{address['state']} #{address['postalCode']}",
    longitude: address['coordinates']['lng'],
    latitude: address['coordinates']['lat']
  )
end

USER_COUNT.times.each do |i|
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password',
    role: USER_ROLES.sample,
    name: Faker::Name.unique.name,
    clinics: Clinic.all.sample(5)
  )
end


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')