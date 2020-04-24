# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding...'

NAMED_PLACE_COUNT = 5
VENUE_COUNT = 20
CLINIC_COUNT = 35
USER_COUNT = 50
PATIENT_COUNT = 1500
CLINIC_EVENTS_PER_PATIENT = 2
CLINIC_STAFF_PER_CLINIC = 4
VENUE_STATES = ["MD"]

puts "Creating named places..."
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

puts "Creating venues..."
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

puts "Creating clinics..."
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
    start_time: "#{(9..12).to_a.sample}:00",
    end_time: "#{(13..17).to_a.sample}:00",
    duration: 180,
    age_groups: ClinicAgeGroup.all.sample(rand(ClinicAgeGroup.count) + 1),
    services: ClinicService.all.sample(rand(ClinicService.count) + 1),
    address: "#{address['address1']}, #{address['city']}, #{address['state']} #{address['postalCode']}",
    longitude: address['coordinates']['lng'],
    latitude: address['coordinates']['lat'],
    appointment_frequency_minutes: [10, 15, 30, 60].sample,
    appointment_slots: (2..10).to_a.sample,
    appointments_available: 'required'
  )
end

puts "Creating clinic staff..."
(CLINIC_COUNT * CLINIC_STAFF_PER_CLINIC).times.each do |i|
  ClinicStaff.create(
    name: Faker::Name.unique.name,
    clinic: Clinic.all.sample
  )
end

puts "Creating users..."
USER_COUNT.times.each do |i|
  User.create!(
    email: i == 5 ? "sam@test.com" : Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password',
    role: USER_ROLES.sample,
    name: i == 5 ? "Sam Kennedy" : Faker::Name.unique.name,
    clinics: Clinic.all.sample(5)
  )
end

addresses = JSON.load(Rails.root.join("db/addresses.json"))["addresses"]
addresses.select!{|a| VENUE_STATES.include?(a["state"])}
puts "Creating patients..."
PATIENT_COUNT.times.each do |i|
  address = addresses.sample
  clinic = Clinic.all.sample
  Patient.create!(
    clinic: clinic,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    middle_initial: ("A".."Z").to_a.sample,
    mothers_maiden_name: Faker::Name.last_name,
    age: (3..80).to_a.sample,
    email: Faker::Internet.email,
    date_of_birth: Faker::Date.birthday,
    address: address['address1'],
    city: address['city'],
    state: address['state'],
    zip_code: address['postalCode'],
    county: COUNTIES.sample,
    access_code: Patient.generate_access_code,
    sex: %w(M F).sample,
    phone_number: Faker::PhoneNumber.cell_phone,
    appointment_time: clinic.appointment_times.sample
  )
end

puts "Creating clinic events..."
(PATIENT_COUNT * CLINIC_EVENTS_PER_PATIENT).times.each do |i|
  clinic = Clinic.all.sample
  clinic_event = CLINIC_EVENTS.sample
  patients = Patient.all.to_a
  users = User.all.to_a
  ClinicEvent.create(
    clinic: clinic,
    patient: patients.sample,
    category: clinic_event[:name],
    clinic_staff_id: clinic.clinic_personnel.sample,
    outcome: clinic_event[:outcomes].sample,
    created_at: Faker::Date.between(from: 30.days.ago, to:Date.today),
    user: User.all.sample,
    notes: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 2, supplemental: true)
  )

end


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

puts 'Done.'
