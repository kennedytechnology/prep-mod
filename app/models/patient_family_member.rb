class PatientFamilyMember < ApplicationRecord
  belongs_to :patient

  validates :first_name, presence: true
end
