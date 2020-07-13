class ProviderEnrollment < ApplicationRecord
  has_many :clinics
  
  has_and_belongs_to_many :clinic_age_groups
  has_and_belongs_to_many :clinic_primary_groups
  has_and_belongs_to_many :clinic_services

  accepts_nested_attributes_for :clinic_age_groups
  accepts_nested_attributes_for :clinic_primary_groups
  accepts_nested_attributes_for :clinic_services

  validates_presence_of :clinic_age_groups, message: '- Please select: Population(s) Served?'
  validates_presence_of :clinic_primary_groups, message: '- Please select: What high-risk or under-served groups are largely represented in your practice?'
  validates_presence_of :clinic_services, message: '- Please select: What services would you like to provide?'

  validates_presence_of :first_name, :middle_initial, :last_name,
                        :title, :contact_office_phone, :contact_mobile_phone,
                        :contact_email, :county, :npi_number,
                        :license_number, :license_state_of_issue, :license_date_of_issue,
                        :medical_specialty, :practice_type, :practice_mobile_phone,
                        :practice_email, :practice_name, :practice_address,
                        :practice_city, :practice_state, :practice_zip_code,
                        :practice_office_phone, :practice_backup_contact, :practice_backup_office_phone,
                        :practice_backup_email, :practice_backup_mobile_phone, :refrigerator, :freezer,
                        :refrigerator_thermometer, :professional_license

  validates :does_provide_vaccination, inclusion: [true, false]
  validates :does_provide_vfc, inclusion: [true, false]

  # after_create :set_default_unique_number, if: lambda { unique_number == nil }
  # after_update :send_email, if: lambda { status == "accepted" }
  # after_update :email_provider_denial, if: lambda { status == "denied" }
  # after_update :create_provider, if: lambda { status == "accepted" }
  # after_update :invite_user, if: lambda { status == "accepted" }

  # def set_default_unique_number 
  #   self.unique_number = "P#{self.id}"
  # end

  def send_email
    ProviderEnrollmentMailer.acceptance_confirmation(self).deliver
  end

  def email_provider_denial
    ProviderEnrollmentMailer.email_provider_denial(self).deliver
  end

  def create_provider
    @provider = Provider.create(self.attributes.except('id').except('status'))
  end

  def invite_user
    user = User.invite!(email: self.practice_email, name: "#{self.first_name} #{self.last_name}", role: 'Regional Administrator')
    @provider.user = user
    @provider.save
  end
end
