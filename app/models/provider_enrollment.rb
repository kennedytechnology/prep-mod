class ProviderEnrollment < ApplicationRecord
  has_and_belongs_to_many :clinic_age_groups
  has_and_belongs_to_many :clinic_services
  accepts_nested_attributes_for :clinic_services
<<<<<<< HEAD
  has_and_belongs_to_many :clinic_primary_groups
=======

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
>>>>>>> a70f94d06ae5c47a7f317190cda29cbf9db110ff
end
