class Venue < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :clinics
  has_many :patients
  has_many :patient_family_members
end
