class Venue < ApplicationRecord
  has_many :users
  has_many :clinics
end
