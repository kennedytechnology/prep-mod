FactoryBot.define do
  factory :provider_enrollment do
    first_name { "A" }
    middle_initial { Faker::Name.middle_name }
    last_name { Faker::Name.first_name }
    title { "Title 1" }
    contact_office_phone { Faker::PhoneNumber.cell_phone }
    contact_mobile_phone { Faker::PhoneNumber.cell_phone }
    contact_email { Faker::Internet.email }
    county { COUNTIES.sample }
    npi_number { "npi number 1" }
    license_type { "License Type" }
    license_number { "license number 1" }
    license_state_of_issue { "#{US_STATES.sample}" }
    license_date_of_issue { Date.today }
    medical_specialty { MEDICAL_SPECIALTY.sample }
    practice_type { PRACTICE_TYPES.sample }
    practice_mobile_phone { Faker::PhoneNumber.cell_phone }
    practice_office_phone { Faker::PhoneNumber.cell_phone }
    practice_email { Faker::Internet.email }
    practice_name { "Practice Name 1" }
    practice_address { Faker::Address.full_address }
    practice_city { Faker::Address.city }
    practice_state { "#{US_STATES.sample}" }
    practice_zip_code { Faker::Address.zip_code }
    practice_fax_number { "Fax Number"}
    practice_backup_contact { Faker::Name.name }
    practice_backup_office_phone { Faker::PhoneNumber.cell_phone }
    practice_backup_email { Faker::Internet.email }
    practice_backup_mobile_phone { Faker::PhoneNumber.cell_phone }
    refrigerator { Faker::Boolean.boolean }
    freezer { Faker::Boolean.boolean }
    refrigerator_thermometer { Faker::Boolean.boolean }
    professional_license { PROFESSIONAL_LICENSES.sample }
    does_provide_vaccination { Faker::Boolean.boolean }
    does_provide_vfc { Faker::Boolean.boolean }
    additional_info { "Additional info" }
    status { "pending" }

    # clinic_age_groups_attributes { [{name:"Adults"}] }
    # clinic_primary_groups_attributes { [{name:"Hispanics"}] }
    # clinic_services_attributes { [{name:"Vaccination"}] }

    # clinic_services { ClinicService.where(category: "provider_enrollments").sample(rand(1..ClinicService.count)) }
    # clinic_age_groups { ClinicAgeGroup.all.sample(rand(1..ClinicAgeGroup.count)) }
    # clinic_primary_groups { ClinicPrimaryGroup.all.sample(rand(1..ClinicPrimaryGroup.count)) }

    before(:create) { |object| object.clinic_services.build() }
    before(:create) { |object| object.clinic_age_groups.build() }
    before(:create) { |object| object.clinic_primary_groups.build() }
  end
end
