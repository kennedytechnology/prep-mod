class Patient < ApplicationRecord
  has_many :insurance_types
end
