class Patient < ApplicationRecord
  has_many :insurance_types
  has_many :clinic_events
  has_many :appointments
  has_many :clinics, through: :appointments
  has_many :patient_family_members
  has_and_belongs_to_many :employers
  has_one_attached :insurance_card_front
  has_one_attached :insurance_card_back
  belongs_to :user, optional: true

  accepts_nested_attributes_for :patient_family_members

  validates :first_name, presence: true
  validates :last_name, presence: true

  scope :with_appointments, -> {
    joins(:appointments).where.not(appointments: {appointment_at: nil})
  }

  scope :on_waiting_list, -> {
    joins(:appointments).where(appointments: {on_waiting_list: true})
  }

  def current_clinic
    appointments.last.clinic
  end

  def self.generate_access_code(size = 6)
    charset = %w{2 3 4 6 7 9 A C D E F G H J K M N P Q R T W X Y Z}
    charset.sample(size).join
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_address
    "#{address}, #{city}, #{state} #{zip_code}"
  end

  def event_for_clinic(clinic)
    result = clinic_events.detect{|ce| ce.clinic == clinic}
    if result.nil?
      result = clinic_events.new(clinic: clinic)
    end
    return result
  end

  def check_in_code
    if self[:check_in_code].blank?
      self[:check_in_code] = Patient.generate_access_code(10)
      save
    end
    self[:check_in_code]
  end

  def sms_invite
    client = SmsClient.new
    to_number = phone_number
    to_number = "+14075366339" if Rails.env.development?
    client.send_message(
      from: ENV['TWILIO_FROM_PHONE'],
      to: to_number,
      body: "Your registration is complete. To schedule your COVID-19 test, go to #{ENV['SITE_URL']}/client/registration/#{access_code}"
    )
  end

  ransacker :date_of_birth_cont, type: :date do
    Arel.sql('date(date_of_birth_cont)')
  end
end
