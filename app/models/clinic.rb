class Clinic < ApplicationRecord
  include AASM

  belongs_to :provider_enrollment, optional: true
  has_many :clinic_vaccines
  has_many :clinic_personnel, class_name: "ClinicStaff"
  has_many :clinic_events
  has_many :patients #, through: :clinic_events
  has_and_belongs_to_many :users
  has_and_belongs_to_many :services, class_name: "ClinicService"
  has_and_belongs_to_many :age_groups, class_name: "ClinicAgeGroup"
  has_and_belongs_to_many :primary_groups, class_name: "ClinicPrimaryGroup"
  has_many :test_kits
  
  accepts_nested_attributes_for :clinic_personnel, allow_destroy: true, 
    reject_if: lambda {|attributes| attributes['name'].blank?}

  accepts_nested_attributes_for :clinic_events, reject_if: lambda {|attributes| attributes['category'].blank?}
  accepts_nested_attributes_for :test_kits, allow_destroy: true, reject_if: :all_blank

  geocoded_by :address
  after_validation :geocode, if: :should_geocode?
  after_validation :parse_time

  attr_accessor :start_hour_minute, :start_meridiem,
    :end_hour_minute, :end_meridiem

  validates :public_or_private, presence: true
  validates :clinic_date, presence: true
  validates :venue_name, presence: true
  validates :county, presence: true
  validates :address, presence: true
  validates :lead_vaccinator_name, presence: true

  aasm column: :open_state do
    state :upcoming, initial: :true
    state :opened_for_check_in, :opened, :closed

    event :open_for_check_in do
      transitions from: :upcoming, to: :opened_for_check_in
    end

    event :open do
      transitions from: :opened_for_check_in, to: :opened
    end

    event :close do
      transitions from: :opened, to: :closed
    end
  end

  def available_event_names
    aasm.events(permitted: true).collect(&:name).collect(&:to_s)
  end

  def parse_time
    if start_hour_minute && start_meridiem
      self.start_time = Time.find_zone("UTC").parse("#{start_hour_minute}#{start_meridiem}")
    end
    if end_hour_minute && end_meridiem 
      self.end_time = Time.find_zone("UTC").parse("#{end_hour_minute}#{end_meridiem}")
    end
  end

  def send_reminders
    patients.each do |p|
      RemindQueuedPatientJob.perform_later p if p.notify_via_sms?
      PatientNotifierMailer.with(patient: p).check_in_reminder.deliver_later if p.notify_via_email?
    end
  end

  def default_test_kit=(value)
    test_kit = test_kits.find(value)
    test_kits.each{|tk| tk.is_default = false; tk.save;}
    test_kit.is_default = true
    test_kit.save
  end

  def clinic_staff; clinic_personnel; end
  
  def duration
    (end_time - start_time) / 60
  end

  def should_geocode?
    address_changed? && !latitude_changed?
  end

  def name
    "#{venue_name} on #{clinic_date}"
  end

  def appointment_times
    this_time = start_time
    last_time = end_time
    results = []
    while this_time < last_time
      results << this_time.strftime("%l:%M%P")
      this_time = this_time + appointment_frequency_minutes.to_i.minutes
    end
    return results
  end

  def test_kits_names_types
    test_kit_names = []
    test_kits.each do |t|
      test_kit_names << t.test_name +  " (" + t.test_type.to_s + ")"
    end
    return test_kit_names
  end

  def default_test_kit_name
    t = test_kits.select(&:is_default).first
    t.test_name +  " (" + t.test_type.to_s + ")"
  end

  def can_check_in?
    opened_for_check_in? || opened?
  end

  def search_string
    venue_name + clinic_date.to_s + county
  end

  def public?
    public_or_private == "Public"
  end

  def private?
    public_or_private == "Private"
  end

end
