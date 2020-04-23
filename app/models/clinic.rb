class Clinic < ApplicationRecord
  belongs_to :venue
  has_many :clinic_vaccines
  has_many :clinic_personnel, class_name: "ClinicStaff"
  has_many :clinic_events
  has_many :patients, through: :clinic_events
  has_and_belongs_to_many :users

  accepts_nested_attributes_for :clinic_personnel, allow_destroy: true, 
    reject_if: lambda {|attributes| attributes['name'].blank?}

  delegate :place_name, to: :venue

  geocoded_by :address
  after_validation :geocode, if: :should_geocode?

  def should_geocode?
    address_changed? && !latitude_changed?
  end

  has_and_belongs_to_many :services, class_name: "ClinicService"
  has_and_belongs_to_many :age_groups, class_name: "ClinicAgeGroup"

  def name
    "#{venue.name} on #{clinic_date}"
  end

  def self.appointment_times
    base_time = Time.new(2000,1,1,10,30,0)
    (0..16).to_a.collect{|i|
      (base_time + (i * 15).minutes).strftime("%l:%M%P")
    }
  end

end
