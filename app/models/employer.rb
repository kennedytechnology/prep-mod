class Employer < ApplicationRecord
  serialize :business_locations, Array
  has_and_belongs_to_many :patients

  def full_name
    "#{first_name} #{last_name}"
  end
end
