class ClinicEvent < ApplicationRecord
  belongs_to :clinic, optional: true
  belongs_to :patient
  belongs_to :user, optional: true
  has_and_belongs_to_many :clinic_services

  def self.available_locations
    locations = []
    locations << Clinic.all.collect(&:venue_name)
    locations << Employer.all.collect(&:company_name)
    return locations.flatten
  end

end
