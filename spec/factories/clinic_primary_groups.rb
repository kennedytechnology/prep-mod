FactoryBot.define do
  factory :clinic_primary_group do
    name { ["Seniors", "African-Americans", "Hispanics", "Chronically Ill (eg. asthma, diabetes, heart disease, hypertension, COPD)"].sample }
  end
end
