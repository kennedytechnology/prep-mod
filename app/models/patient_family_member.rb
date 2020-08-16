class PatientFamilyMember < ApplicationRecord
  belongs_to :patient
  belongs_to :venue
  has_and_belongs_to_many :vaccine_offerings

  validates :first_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
