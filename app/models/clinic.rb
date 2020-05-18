class Clinic < ApplicationRecord
  belongs_to :provider_enrollment
  has_many :clinic_vaccines
  has_many :clinic_personnel, class_name: "ClinicStaff"
  has_many :clinic_events
  has_many :patients #, through: :clinic_events
  has_and_belongs_to_many :users
  has_and_belongs_to_many :services, class_name: "ClinicService"
  has_and_belongs_to_many :age_groups, class_name: "ClinicAgeGroup"
  has_and_belongs_to_many :primary_groups, class_name: "ClinicPrimaryGroup"
  has_many :supply_inventories
  has_many :test_kits
  
  accepts_nested_attributes_for :clinic_personnel, allow_destroy: true, 
    reject_if: lambda {|attributes| attributes['name'].blank?}

  accepts_nested_attributes_for :clinic_events, reject_if: lambda {|attributes| attributes['category'].blank?}
  accepts_nested_attributes_for :test_kits, allow_destroy: true, reject_if: :all_blank

  geocoded_by :address
  after_validation :geocode, if: :should_geocode?
  after_validation :parse_time

  attr_accessor :start_hour, :start_minute, :start_meridiem,
    :end_hour, :end_minute, :end_meridiem

  def parse_time
    if start_hour && start_minute && start_meridiem
      self.start_time = Time.find_zone("UTC").parse("#{start_hour}:#{end_minute}#{start_meridiem}")
    end
    if end_hour && end_minute && end_meridiem 
      self.end_time = Time.find_zone("UTC").parse("#{end_hour}:#{end_minute}#{end_meridiem}")
    end
  end
  def clinic_staff; clinic_personnel; end

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
      test_kit_names << t.test_name +  " (" + t.test_type + ")"
    end
    return test_kit_names
  end

  def search_string
    venue_name + clinic_date.to_s + county
  end
end
