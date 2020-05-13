# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding...'

NAMED_PLACE_COUNT = 5
CLINIC_COUNT = 50
USER_COUNT = 10
PATIENT_COUNT = 1500
CLINIC_EVENTS_PER_PATIENT = 2
CLINIC_STAFF_PER_CLINIC = 4
SUPPLY_INVENTORY_PER_CLINIC = 6
TEST_KITS_PER_CLINIC = 3
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


addresses = JSON.load(Rails.root.join("db/addresses.json"))["addresses"]
addresses.select!{|a| VENUE_STATES.include?(a["state"])}
addresses.shuffle!

puts "Creating clinics..."
CLINIC_COUNT.times.each do |i|
  address = addresses.pop
  Clinic.create(
    venue_name: Faker::University.unique.name,
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
    appointments_available: 'required',
    county: COUNTIES.sample
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
clinics = Clinic.all
PATIENT_COUNT.times.each do |i|
  address = addresses.sample
  clinic = clinics.sample
  patientEmail = Faker::Internet.email
  Patient.create!(
    clinic: clinic,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    middle_initial: ("A".."Z").to_a.sample,
    mothers_maiden_name: Faker::Name.last_name,
    age: (3..80).to_a.sample,
    email: patientEmail,
    date_of_birth: Faker::Date.birthday,
    address: address['address1'],
    city: address['city'],
    state: address['state'],
    zip_code: address['postalCode'],
    county: COUNTIES.sample,
    access_code: Patient.generate_access_code,
    sex: %w(M F).sample,
    phone_number: Faker::PhoneNumber.cell_phone,
    appointment_time: clinic.appointment_times.sample, 
    student_id: Faker::IDNumber.unique,
    user_id: Faker::IDNumber.unique,
    email_confirmation: patientEmail,
    notify_via_sms: Faker::Boolean.boolean,
    notify_via_email: Faker::Boolean.boolean,
  )
end

puts "Creating clinic events..."
patients = Patient.all.to_a
users = User.all.to_a
clinics = Clinic.all.to_a
(PATIENT_COUNT * CLINIC_EVENTS_PER_PATIENT).times.each do |i|
  clinic_event = CLINIC_EVENTS.sample  
  clinic = clinics.sample
  ClinicEvent.create(
    clinic: clinic,
    patient: patients.sample,
    category: clinic_event[:name],
    clinic_staff_id: clinic.clinic_personnel.sample,
    outcome: clinic_event[:outcomes].sample,
    created_at: Faker::Date.between(from: 30.days.ago, to:Date.today),
    user: users.sample,
    notes: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 2, supplemental: true)
  )

end

Clinic.all.each do |clinic|
  SUPPLY_INVENTORY_PER_CLINIC.times do
    SupplyInventory.create!(
      clinic: clinic,
      received_at: Faker::Date.between(from: 30.days.ago, to:Date.today),
      item_type: INVENTORY_ITEM_TYPES.sample,
      item_name: Faker::Lorem.words(number: 2).collect(&:capitalize).join(" "),
      manufacturer: INVENTORY_MANUFACTURERS.sample,
      lot_number: Faker::Code.asin,
      expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now),
      quantity: Faker::Number.between(from: 10, to: 20),
      quantity_used: Faker::Number.between(from: 1, to: 5),
      quantity_lost: Faker::Number.between(from: 1, to: 3),
      quantity_loaned: Faker::Number.between(from: 1, to: 3),
      packaging: INVENTORY_PACKAGINGS.sample,
      source: INVENTORY_SOURCES.sample,
      product_name: Faker::Company.name,
      event_type: INVENTORY_EVENT_TYPES.sample
    )
  end
end

Clinic.all.each do |clinic|
  TEST_KITS_PER_CLINIC.times do
    TestKit.create!(
      clinic: clinic,
      test_name: Faker::Lorem.words(number: 2).collect(&:capitalize).join(" "),
      test_manufacturer: INVENTORY_MANUFACTURERS.sample,
      test_lot_number: Faker::Code.asin,
      test_type: %w(PCR Serological).sample,
      test_processing: %w(Standard Rapid).sample,
      test_expiration_date: Faker::Date.between(from: 30.days.from_now, to: 365.days.from_now),
      test_kits_quantity: Faker::Number.between(from: 50, to: 1000)
    )
  end
end

10.times do |i|
  ProviderEnrollment.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.first_name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    fax_number: "fax #{i}",
    email: Faker::Internet.email,
    npi_number: "npi number #{i}",
    license_number: "license number #{i}",
    license_type: "license type #{i}",
    medical_specialty: "specialty #{i}"
  )
end

10.times do |i|
  Employer.create!(
    screening_info: Faker::Boolean.boolean,
    testing_info: Faker::Boolean.boolean,
    vacination_info: Faker::Boolean.boolean,
    other_info: Faker::Boolean.boolean,
    business_locations: BUSINESS_LOCATIONS.sample(1 + rand(BUSINESS_LOCATIONS.count)),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.first_name,
    position: "position #{i}",
    company_name: Faker::Company.name,
    address_1: Faker::Address.full_address,
    address_2: Faker::Address.full_address,
    city: Faker::Address.city,
    zip_code: Faker::Address.zip_code,
    state: Faker::Address.state,
    office_phone: Faker::PhoneNumber.cell_phone,
    mobile_phone: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    website: Faker::Internet.url,
    backup_first_name: Faker::Name.first_name,
    backup_last_name: Faker::Name.first_name,
    backup_position: "backup position #{i}",
    backup_company_name: Faker::Company.name,
    backup_address_1: Faker::Address.full_address,
    backup_address_2: Faker::Address.full_address,
    backup_city: Faker::Address.city,
    backup_zip_code: Faker::Address.zip_code,
    backup_state: Faker::Address.state,
    backup_office_phone: Faker::PhoneNumber.cell_phone,
    backup_mobile_phone: Faker::PhoneNumber.cell_phone,
    backup_email: Faker::Internet.email,
    total_employees: Faker::Number.between(from: 5, to: 50),
    total_locations: Faker::Number.between(from: 5, to: 10)
  )
end


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

puts 'Done.'
