class Venue < ApplicationRecord
  has_many :users
  has_many :clinics
  has_many :patients
end
