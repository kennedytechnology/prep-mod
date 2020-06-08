class ProviderEnrollment < ApplicationRecord
  has_and_belongs_to_many :clinic_age_groups
  accepts_nested_attributes_for :clinic_age_groups
  has_and_belongs_to_many :clinic_primary_groups
  accepts_nested_attributes_for :clinic_primary_groups
  has_and_belongs_to_many :clinic_services
  accepts_nested_attributes_for :clinic_services
  has_many :clinics

  after_create :set_default_status_and_unique_number, if: lambda { unique_number == nil }
  after_update :send_email, if: lambda { status == "accepted" }

  def set_default_status_and_unique_number
    self.status = "pending"
    self.unique_number = "P#{self.id}"
    self.save
  end

  def send_email
    ProviderEnrollmentMailer.acceptance_confirmation(self).deliver
  end
end
