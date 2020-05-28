class ClinicEvent < ApplicationRecord
  belongs_to :clinic, optional: true
  belongs_to :patient
  belongs_to :user, optional: true
end
