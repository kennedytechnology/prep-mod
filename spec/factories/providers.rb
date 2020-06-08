FactoryBot.define do
  factory :provider do
    first_name { "MyString" }
    last_name { "MyString" }
    practice_fax_number { "MyString" }
    npi_number { "MyString" }
    license_number { "MyString" }
    license_type { "MyString" }
    medical_specialty { "MyString" }
    professional_license { "MyString" }
    license_date_of_issue { "" }
    title { "MyString" }
    practice_name { "MyString" }
    practice_address { "MyString" }
    practice_city { "MyString" }
    practice_state { "MyString" }
    practice_zip_code { 1 }
    practice_office_phone { "MyString" }
  end
end
