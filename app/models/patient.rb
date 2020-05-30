class Patient < ApplicationRecord
  include AASM
  has_many :insurance_types
  has_many :clinic_events
  has_many :clinics, through: :clinic_events
  belongs_to :clinic, optional: true
  has_many :patient_family_members
  has_and_belongs_to_many :employers
  has_one_attached :insurance_card_front
  has_one_attached :insurance_card_back

  accepts_nested_attributes_for :patient_family_members

  validates :first_name, presence: true
  validates :last_name, presence: true

  aasm column: :queue_state do
    state :not_checked_in, initial: true
    state :canceled, :checked_in, :invited, :at_clinic, :done

    event :cancel do
      transitions from: [:not_checked_in, :checked_in, :invited], to: :canceled
    end

    event :check_in do
      transitions from: :not_checked_in, to: :checked_in, if: :clinic_can_check_in?
    end

    event :invite, after: :notify_invitation do
      transitions from: :checked_in, to: :invited, if: :clinic_is_open?
    end

    event :mark_arrived do
      transitions from: :invited, to: :at_clinic
    end

    event :finish do
      transitions from: :at_clinic, to: :done
    end
  end

  def notify_invitation
    InviteQueuedPatientJob.perform_later self
  end

  def clinic_is_open?
    clinic.opened?
  end

  def clinic_can_check_in?
    clinic.can_check_in?
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

  def available_event_names
    aasm.events(permitted: true).collect(&:name).collect(&:to_s)
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
    client = Twilio::REST::Client.new
    to_number = phone_number
    to_number = "+14075366339" if Rails.env.development?
    client.messages.create({
      from: ENV['TWILIO_FROM_PHONE'],
      to: to_number,
      body: "Your registration is complete. To schedule your COVID-19 test, go to #{ENV['SITE_URL']}/client/registration/#{access_code}"
    })
  end

  ransacker :date_of_birth_cont, type: :date do
    Arel.sql('date(date_of_birth_cont)')
  end
end
