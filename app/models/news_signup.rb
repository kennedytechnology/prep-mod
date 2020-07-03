class NewsSignup < ApplicationRecord
  serialize :topics, Array

  validates_presence_of :email, :first_name, :last_name, :date_of_birth, :zip_code, :occupation
  validates :chronic_health_condition, inclusion: { in: [ true, false ] }
end
