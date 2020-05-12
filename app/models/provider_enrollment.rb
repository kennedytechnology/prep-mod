class ProviderEnrollment < ApplicationRecord
  has_and_belongs_to_many :clinic_services
end
