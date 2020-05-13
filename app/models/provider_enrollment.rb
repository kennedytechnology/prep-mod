class ProviderEnrollment < ApplicationRecord
  has_and_belongs_to_many :clinic_age_groups
  has_and_belongs_to_many :clinic_services
  accepts_nested_attributes_for :clinic_services
end
