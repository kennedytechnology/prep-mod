FactoryBot.define do
  factory :patient_family_member do
    first_name { "MyString" }
    middle_initial { "MyString" }
    last_name { "MyString" }
    mothers_maiden_name { "MyString" }
    race { "MyString" }
    date_of_birth { "2020-05-25" }
    insurance_company_name { "MyString" }
    member_id_for_insurance { "MyString" }
    group_number_for_insurance { "MyString" }
  end
end
