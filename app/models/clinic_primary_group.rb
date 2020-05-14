class ClinicPrimaryGroup < ApplicationRecord
  has_and_belongs_to_many :clinics
  has_and_belongs_to_many :provider_enrollments
end
