class PatientFamilyMember < ApplicationRecord
  belongs_to :patient

  validates :first_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
