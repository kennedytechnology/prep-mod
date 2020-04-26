class Clinic < ApplicationRecord
  belongs_to :venue
  has_many :clinic_vaccines
  has_many :clinic_personnel, class_name: "ClinicStaff"
  has_many :clinic_events
  has_many :patients #, through: :clinic_events
  has_and_belongs_to_many :users
  has_many :supply_inventories

  accepts_nested_attributes_for :clinic_personnel, allow_destroy: true, 
    reject_if: lambda {|attributes| attributes['name'].blank?}

  delegate :place_name, to: :venue

  geocoded_by :address
  after_validation :geocode, if: :should_geocode?

  def clinic_staff; clinic_personnel; end

  def should_geocode?
    address_changed? && !latitude_changed?
  end

  has_and_belongs_to_many :services, class_name: "ClinicService"
  has_and_belongs_to_many :age_groups, class_name: "ClinicAgeGroup"

  def name
    "#{venue.name} on #{clinic_date}"
  end

  def appointment_times
    this_time = Time.parse(start_time)
    last_time = Time.parse(end_time)
    results = []
    while this_time < last_time
      results << this_time.strftime("%l:%M%P")
      this_time = this_time + appointment_frequency_minutes.to_i.minutes
    end
    return results
  end

end
