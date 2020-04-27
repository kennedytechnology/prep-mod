class ClinicEvent < ApplicationRecord
  belongs_to :clinic
  belongs_to :patient
  belongs_to :user, optional: true
end
