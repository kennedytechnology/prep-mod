class Employer < ApplicationRecord
  serialize :business_locations, Array
  has_and_belongs_to_many :patients
end
