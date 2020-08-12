class ClinicEvent < ApplicationRecord
  belongs_to :clinic, optional: true
  belongs_to :patient
  belongs_to :user, optional: true
  has_and_belongs_to_many :clinic_services
  before_save :send_notification, if: lambda { safety_kit_received == true }


  def send_notification
    ClinicMailer.send_vaccinated_confirmation(self).deliver
  end

  def self.available_locations
    locations = []
    locations << Clinic.all.collect(&:venue_name)
    locations << Employer.all.collect(&:company_name)
    return locations.flatten
  end

end
