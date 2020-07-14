FactoryBot.define do
  factory :provider_enrollment do
    before(:create) { |provider_enrollment| provider_enrollment.clinic_services << create(:clinic_service) }
    before(:create) { |provider_enrollment| provider_enrollment.clinic_age_groups << create(:clinic_age_group) }
    before(:create) { |provider_enrollment| provider_enrollment.clinic_primary_groups << create(:clinic_primary_group) }
  
    first_name { Faker::Name.first_name }
    middle_initial { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
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
  end
end
