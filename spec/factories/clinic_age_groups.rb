FactoryBot.define do
  factory :clinic_age_group do
    name { ["All Ages", "Children", "Adults", "Seniors", "Other"].sample }
  end
end
