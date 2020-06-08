# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding...'

NAMED_PLACE_COUNT = 50
CLINIC_COUNT = 5
USER_COUNT = 100
PATIENT_COUNT = 40
CLINIC_EVENTS_PER_PATIENT = 3
CLINIC_STAFF_PER_CLINIC = 3
SUPPLY_INVENTORY_PER_CLINIC = 10
TEST_KITS_PER_CLINIC = 3
VENUE_STATES = ["MD", "NY", "PA", "DC", "KY", "VT", "CA", "CO", "AL"]

def age(birthday, today)
  diff = today.year - birthday.year
  (birthday + diff.years > today ) ? (diff - 1) : diff
end


puts "Creating named places..."
NAMED_PLACE_COUNT.times.each do |i|
  NamedPlace.create(
    name: Faker::JapaneseMedia::OnePiece.unique.island
  )
end

["Screening", "Testing", "Medication", "Safety Kit Distribution", "Other"].each do |name|
  ClinicService.create!(name: name, category: "clinics")
  ClinicService.create!(name: name, category: "provider_enrollments")
end

["Screened", "Tested - PCR", "Tested - Serology", "Temperature Check", "Safety Kit", "Other"].each do |name|
  ClinicService.create!(name: name, category: "clinic_events")
end

["All Ages", "Children", "Adults", "Seniors", "Other"].each do |name|
  ClinicAgeGroup.create!(name: name)
end

["Seniors", "African-Americans", "Hispanics", "Chronically Ill (eg. asthma, diabetes, heart disease, hypertension, COPD)"].each do |name|
  ClinicPrimaryGroup.create!(name: name)
end

addresses = JSON.load(Rails.root.join("db/addresses.json"))["addresses"]
addresses.select!{|a| VENUE_STATES.include?(a["state"])}
addresses.shuffle!

puts "Creating users..."
USER_COUNT.times.each do |i|
  User.create!(
    email: i == 5 ? "user@test.com" : Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password',
    role: USER_ROLES.sample,
    name: i == 5 ? "Sam Kennedy" : Faker::Name.unique.name,
    clinics: Clinic.all.sample(5)
  )
end

puts "Creating providers..."
10.times do |i|
  ProviderEnrollment.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.first_name,
    middle_initial: Faker::Name.middle_name,
    professional_license: PROFESSIONAL_LICENSES.sample,
    title: "Title #{i}",
    contact_office_phone: Faker::PhoneNumber.cell_phone,
    contact_mobile_phone: Faker::PhoneNumber.cell_phone,
    contact_email: Faker::Internet.email,
    county: COUNTIES.sample,
    license_state_of_issue: US_STATES.sample,
    license_date_of_issue: Faker::Date.between(from: 30.days.from_now, to: 365.days.from_now),
    practice_office_phone: Faker::PhoneNumber.cell_phone,
    practice_fax_number: "fax #{i}",
    practice_mobile_phone: Faker::PhoneNumber.cell_phone,
    practice_email: Faker::Internet.email,
    practice_type: PRACTICE_TYPES.sample,
    practice_name: "Practice Name #{i}",
    practice_address: Faker::Address.full_address,
    practice_city: Faker::Address.city,
    practice_state: US_STATES.sample,
    practice_zip_code: Faker::Address.zip_code,
    practice_backup_contact: Faker::Name.name,
    practice_backup_office_phone: Faker::PhoneNumber.cell_phone,
    practice_backup_email: Faker::Internet.email,
    practice_backup_mobile_phone: Faker::PhoneNumber.cell_phone,
    does_provide_vaccination:Faker::Boolean.boolean,
    does_provide_vfc: Faker::Boolean.boolean,
    refrigerator: Faker::Boolean.boolean,
    freezer: Faker::Boolean.boolean,
    refrigerator_thermometer: Faker::Boolean.boolean,
    additional_info: Faker::Lorem.paragraph,
    npi_number: "npi number #{i}",
    license_number: "license number #{i}",
    license_type: "license type #{i}",
    medical_specialty: MEDICAL_SPECIALTY.sample
  )
end

puts "Creating employers..."
10.times do |i|
  Employer.create!(
    screening_info: Faker::Boolean.boolean,
    testing_info: Faker::Boolean.boolean,
    vacination_info: Faker::Boolean.boolean,
    other_info: Faker::Boolean.boolean,
    business_locations: BUSINESS_LOCATIONS.sample(rand(4)),
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

puts "Creating clinics..."
CLINIC_COUNT.times.each do |i|
  address = addresses.pop
  clinic = Clinic.create(
    user_id: User.take.id,
    provider_enrollment_id: ProviderEnrollment.take.id,
    venue_name: Faker::University.unique.name,
    clinic_date: Faker::Date.between(from: 1.month.ago, to: 6.months.from_now),
    lead_vaccinator_name: Faker::Name.unique.name,
    students_registered: Faker::Number.normal(mean: 100, standard_deviation: 50),
    clinic_status: %w(Pending Completed Cancelled).sample,
    public_or_private: %w(Public Private).sample,
    outcome_comments: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 9, supplemental: true),
    incidents_comments: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 9, supplemental: true),
    start_time: "#{(9..12).to_a.sample}:00",
    end_time: "#{(13..17).to_a.sample}:00",
    duration: 180,
    age_groups: ClinicAgeGroup.all.sample(rand(ClinicAgeGroup.count) + 1),
    services: ClinicService.where(category: "clinics").sample(rand(ClinicService.count) + 1),
    address: "#{address['address1']}, #{address['city']}, #{address['state']} #{address['postalCode']}",
    longitude: address['coordinates']['lng'],
    latitude: address['coordinates']['lat'],
    location: "Nowhere",
    appointment_frequency_minutes: [10, 15, 30, 60].sample,
    appointment_slots: (2..10).to_a.sample,
    appointments_available: 'required',
    venue_type: VENUE_TYPES.sample,
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

addresses = JSON.load(Rails.root.join("db/addresses.json"))["addresses"]
addresses.select!{|a| VENUE_STATES.include?(a["state"])}
puts "Creating patients..."
clinics = Clinic.all
PATIENT_COUNT.times.each do |i|
  address = addresses.sample
  clinic = clinics.sample
  birthday = Faker::Date.birthday
  patientEmail = Faker::Internet.email
  patient = Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    middle_initial: ("A".."Z").to_a.sample,
    mothers_maiden_name: Faker::Name.last_name,
    age: age(birthday, Date.today),
    email: patientEmail,
    date_of_birth: birthday,
    address: address['address1'],
    city: address['city'],
    state: address['state'],
    zip_code: address['postalCode'],
    county: COUNTIES.sample,
    race: US_RACES.sample,
    access_code: Patient.generate_access_code,
    sex: %w(M F).sample,
    phone_number: "+14075366339",
    student_id: Faker::IDNumber.unique,
    user_id: Faker::IDNumber.unique,
    email_confirmation: patientEmail,
    notify_via_sms: Faker::Boolean.boolean,
    notify_via_email: Faker::Boolean.boolean
  )
  Appointment.create!(
    patient: patient,
    clinic: clinic,
    appointment_at: clinic.appointment_times.sample
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
    event_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    created_at: Faker::Date.between(from: 30.days.ago, to:Date.today),
    location: Faker::Address.street_address,
    user: users.sample,
    notes: Faker::Lorem.paragraph(sentence_count: 0, random_sentences_to_add: 2, supplemental: true)
  )

end

# Clinic.all.each do |clinic|
  SUPPLY_INVENTORY_PER_CLINIC.times do
    sp = SupplyInventory.create!(
      # clinic: clinic,
      received_at: Faker::Date.between(from: 30.days.ago, to:Date.today),
      item_type: INVENTORY_ITEM_TYPES.sample,
      item_name: Faker::Lorem.words(number: 2).collect(&:capitalize).join(" "),
      manufacturer: INVENTORY_MANUFACTURERS.sample,
      lot_number: Faker::Code.asin,
      expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now),
      quantity: Faker::Number.between(from: 100, to: 200),
      packaging: INVENTORY_PACKAGINGS.sample,
      source: INVENTORY_SOURCES.sample,
      product_name: Faker::Company.name,
      county: COUNTIES.sample,
      venue_name: Clinic.pluck(:venue_name).sample,
    )

    Faker::Number.between(from: 1, to: 5).times do 
      sp.supply_inventory_events.create!(
        quantity_used: Faker::Number.between(from: 1, to: 5),
        quantity_lost: Faker::Number.between(from: 1, to: 3),
        quantity_loaned: Faker::Number.between(from: 1, to: 3),
        quantity_destroyed: Faker::Number.between(from: 1, to: 3),
        event_type: INVENTORY_EVENT_TYPES.sample,
        event_date: Faker::Date.between(from: Date.today, to: 30.days.from_now)
      )
    end
  end
# end

Clinic.all.each do |clinic|
  TEST_KITS_PER_CLINIC.times do
    TestKit.create!(
      clinic: clinic,
      test_name: Faker::Dessert.topping,
      test_manufacturer: INVENTORY_MANUFACTURERS.sample,
      test_lot_number: Faker::Code.asin,
      test_type: %w(PCR Serological).sample,
      test_processing: %w(Standard Rapid).sample,
      test_expiration_date: Faker::Date.between(from: 30.days.from_now, to: 365.days.from_now),
      test_kits_quantity: Faker::Number.between(from: 2, to: 50) * 25
    )
  end
  clinic.reload
  clinic.test_kits.sample.update_attribute(:is_default, true)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

puts 'Done.'

