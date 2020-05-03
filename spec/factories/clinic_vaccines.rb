FactoryBot.define do
  factory :clinic_vaccine do
    association :clinic, factory: :clinic
  end
end
