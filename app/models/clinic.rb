class Clinic < ApplicationRecord
  belongs_to :venue
  has_many :clinic_vaccines
  has_many :clinic_personnel, class_name: "ClinicStaff"
  has_many :clinic_events
  has_many :patients, through: :clinic_events
  has_and_belongs_to_many :users

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

end
