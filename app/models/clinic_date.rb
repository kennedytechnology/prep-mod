class ClinicDate < ApplicationRecord
  belongs_to :clinic, optional: true
end
