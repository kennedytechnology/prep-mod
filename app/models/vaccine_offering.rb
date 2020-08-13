class VaccineOffering < ApplicationRecord
  has_and_belongs_to_many :patients
  has_and_belongs_to_many :patient_family_members
end
