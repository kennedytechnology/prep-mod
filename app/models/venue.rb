class Venue < ApplicationRecord
  has_many :users
  has_many :clinics
  has_many :patients
  has_many :patient_family_members
end
