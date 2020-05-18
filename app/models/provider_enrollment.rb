class ProviderEnrollment < ApplicationRecord
  has_and_belongs_to_many :clinic_age_groups
  accepts_nested_attributes_for :clinic_age_groups
  has_and_belongs_to_many :clinic_primary_groups
  accepts_nested_attributes_for :clinic_primary_groups
  has_and_belongs_to_many :clinic_services
  accepts_nested_attributes_for :clinic_services
  has_many :clinics

  before_create do
    self.status = "pending"
  end

  def set_status(status_name)
    case status_name
    when "Need Additional Information"
      self.status = "need_additional_information"
    when "Accepted"
      self.status = "accepted"
    when "Denied"
      self.status = "denied"
    else
      self.status = "pending"
    end
  end
end
