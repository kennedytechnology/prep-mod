class ClinicAgeGroup < ApplicationRecord
  has_and_belongs_to_many :clinics
end
